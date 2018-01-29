# CardsController controla link com view
class CardsController < ApplicationController
  before_action :set_card, only: %i[show edit update destroy]

  # GET /cards
  # GET /cards.json
  def index
    @q = Card.ransack(params[:q])
    @cards = @q.result(distinct: true).joins(:card_status).joins(:card_request).order(registration: :asc)
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
    @card = Card.new(card_params)
    if @card.save
      redirect_to cards_url, flash: { success: StrHelper.system_i18n_upper(:create, %i[activerecord success]) }
    else      
      redirect_to card_requests_url, flash: { error: @card.errors.full_messages.first }
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
    abort params.inspect
    card = Card.find_by_id(params[:id])
    
    #abort card.inspect
    card_status = CardStatus.find_by_describe("USING").first
    card.card_status = card_status
    if DiscardsHelper.validate_card_number_by_discard
      redirect_to cards_url, flash: { error: StrHelper.system_i18n_upper(:card_number_exist, %i[errors messages]) }    
    elsif card.save
      redirect_to cards_url, flash: { success: StrHelper.system_i18n_upper(:cancel, %i[activerecord success]) }
    else
      redirect_to cards_url, flash: { error: card.errors.full_messages.first }
    end
  end  

  def print_request
    @military = Military.find(@card_request.military_registration)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_card
    @card = Card.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def card_params
    params.require(:card).permit(:name, :identification, :hierarchy, :father_name, :mother_name, :born_date, :registration, :naturalness, :vote_number, :vote_zone, :vote_section, :cpf, :digital_factor, :blood_type, :blood_factor, :carry_weapon, :print_locale, :print_date, :expire_date, :card_number, :returned_card, :card_request_id, :card_status_id)
  end
end
