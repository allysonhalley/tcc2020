# CardsController controla link com view
class CardsController < ApplicationController

  require 'prawn'
  require 'prawn-print'

  before_action :set_card, only: %i[show edit update destroy]

  # GET /cards
  # GET /cards.json
  def index
    @q = Card.ransack(params[:q])
    @cards = @q.result(distinct: true).joins(:card_status).joins(:card_request).order(registration: :asc)
    #abort @cards.to_sql
  end

  # GET /cards/1
  # GET /cards/1.json
  def show; end

  # GET /cards/new
  def new
    @card = Card.new
    object_request_id = params[:object_request_id]
    @card.fill_by_request(object_request_id)
  end

  # GET /cards/1/edit
  def edit; end

  # POST /cards
  # POST /cards.json
  def create
    ActiveRecord::Base.transaction do
      @card = Card.new(card_params)
      if @card.save
        pdf = CardPdf.new(@card)        
        #pdf.render_file, filename: "#{@card.registration}-#{@card.name}-#{@card.print_date}", type: "application/pdf"
        #filename = File.join(Rails.root, "public/pdfs", "#{@card.registration}-#{@card.name}-#{@card.print_date}.pdf")
        #pdf.render_file
         # filename: "#{@card.registration}-#{@card.name}-#{@card.print_date}",
         # type: 'application/pdf',
         # disposition: 'inline',
         # flash: { success: StrHelper.system_i18n_upper(:create, %i[activerecord success]) }
        redirect_to cards_url, flash: { success: StrHelper.system_i18n_upper(:create, %i[activerecord success]) }
      else
        redirect_to card_requests_url, flash: { error: @card.errors.full_messages.first }
      end
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    if @card.update(card_params)
      redirect_to @card, flash: { success: StrHelper.system_i18n_upper(:update, %i[activerecord success]) }
    else
      redirect_to cards_url, flash: { error: @card.errors.full_messages.first }
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    if @card.destroy
      redirect_to cards_url, flash: { success: StrHelper.system_i18n_upper(:destroy, %i[activerecord success]) }
    else
      redirect_to cards_url, flash: { error: @card.errors.full_messages.first }
    end
  end

  # GINVING /card_requests/1
  # GINVING /card_requests/1.json
  def giving
    ActiveRecord::Base.transaction do
      giving_card = params[:card]
      card = Card.find_by_registration(giving_card[:registration])
      card.card_number = giving_card[:card_number]
      card.card_status = CardStatus.find_by_describe("USING")
      if DiscardsHelper.validate_card_number_by_discard(card.card_number)
        redirect_to cards_url, flash: { error: StrHelper.system_i18n_upper(:card_number_exist, %i[errors messages]) }
      elsif CardsHelper.validate_card_number_by_card(card.card_number)
        redirect_to cards_url, flash: { error: StrHelper.system_i18n_upper(:card_number_exist, %i[errors messages]) }
      elsif card.save
        card_request = CardRequest.find(card.card_request_id)
        card_request.canceled = true
        if card_request.save
          redirect_to cards_url, flash: { success: StrHelper.system_i18n_upper(:given, %i[activerecord success]) }
        else
          redirect_to cards_url, flash: { error: card.errors.full_messages.first }
        end
      else
        redirect_to cards_url, flash: { error: card.errors.full_messages.first }
      end
    end
  end

  def returning
    returned_card = params[:card]
    card = Card.find_by_registration(returned_card[:registration])
    card.card_status = CardStatus.find_by_describe("RETURNED")
    if card.save
      redirect_to cards_url, flash: { success: StrHelper.system_i18n_upper(:returned, %i[activerecord success]) }
    else
      redirect_to cards_url, flash: { error: card.errors.full_messages.first }
    end
  end

  def print_request
    @military = Military.find(@card_request.military_registration)
  end

  #Print /4full, 2top, 2bot cards
  def print_cards    
    
    ids_requests = CardRequest.all.select(:id).take(4)
    @cards = Array.new
    ids_requests.each do |ids_request|
      card = Card.new
      card.fill_by_request(ids_request.id)
      @cards.push(card)      
    end
    @pdf = CardsPdf.new(@cards)    
    #  case params[:commit]
    #    when 'full'
    #      pdf = CardPdf.new(@cards)
    #    when 'top'
    #      pdf = CardsBotPdf.new(@cards)
    #    when 'bot'
    #      pdf = CardsBotPdf.new(@cards)
    #  end      
    redirect_to cards_url, flash: { success: StrHelper.system_i18n_upper(:printed, %i[activerecord success]) }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_card
    @card = Card.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def card_params
    params.require(:card).permit(:name, :identification, :hierarchy, :father_name, :mother_name, :born_date, :registration, :naturalness, :vote_number, :vote_zone, :vote_section, :cpf, :digital_factor, :blood_type, :blood_factor, :carry_weapon, :print_locale, :print_date, :expire_date, :card_number, :card_request_id, :card_status_id)
  end
end
