class DiscardsController < ApplicationController
  before_action :set_discard, only: %i[show edit update destroy]

  # GET /discards
  # GET /discards.json
  def index
    @q = Discard.ransack(params[:q])
    @discards = @q.result(distinct: true).joins(:card_request).order(created_at: :asc)
  end

  # GET /discards/1
  # GET /discards/1.json
  def show; end

  # GET /discards/new
  def new
    @discard = Discard.new
    card_request_id = params[:card_request_id]
    abort params[:card_request_id].inspect
    @discard.fill_by_request(card_request_id)
  end

  # GET /discards/1/edit
  def edit; end

  # POST /discards
  # POST /discards.json
  def create
    ActiveRecord::Base.transaction do
      @discard = Discard.new(discard_params)
      card = CardsHelper.find_to_discard(@discard.card_request_id)
      if CardsHelper.validate_card_number_by_card(@discard.card_number)
        redirect_to cards_url, flash: { error: StrHelper.system_i18n_upper(:card_number_exist, %i[errors messages]) }
      elsif @discard.save
        if Card.destroy(card.id)
          redirect_to discards_url, flash: { success: StrHelper.system_i18n_upper(:create, %i[activerecord success]) }
        else
          raise ActiveRecord::Rollback
          redirect_to cards_url, flash: { error: discard.errors.full_messages.first }
        end
      else
        redirect_to cards_url, flash: { error: @discard.errors.full_messages.first }
      end
    end
  end

  # PATCH/PUT /discards/1
  # PATCH/PUT /discards/1.json
  def update
    if @discard.update(discard_params)
      redirect_to @discard, flash: { success: StrHelper.system_i18n_upper(:update, %i[activerecord success]) }
    else
      redirect_to cards_url, flash: { error: discard.errors.full_messages.first }
    end
  end

  # DELETE /discards/1
  # DELETE /discards/1.json
  def destroy
    if @discard.destroy
      redirect_to discards_url, flash: { success: StrHelper.system_i18n_upper(:destroy, %i[activerecord success]) }
    else
      redirect_to discards_url, flash: { error: @discard.errors.full_messages.first }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_discard
    @discard = Discard.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def discard_params
    params.require(:discard).permit(:card_number, :card_request_id, :reason_discard)
  end
end
