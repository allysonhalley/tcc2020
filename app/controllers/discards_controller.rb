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
    @discard.fill_by_request(card_request_id)
  end

  # GET /discards/1/edit
  def edit; end

  # POST /discards
  # POST /discards.json
  def create
    @discard = Discard.new(discard_params)
    card = Card.find_by_card_number(@discard.card_number)
    if @discard.save
      card.destroy
      redirect_to @discard, flash: { success: StrHelper.system_i18n_upper(:create, %i[activerecord success]) }
    else
      flash.now[:error] = @discard.errors.full_messages.first
      render :new, @discard
    end
  end

  # PATCH/PUT /discards/1
  # PATCH/PUT /discards/1.json
  def update
    if @discard.update(discard_params)
      redirect_to @discard, flash: { success: StrHelper.system_i18n_upper(:update, %i[activerecord success]) }
    else
      flash.now[:error] = @discard.errors.full_messages.first
      render :edit
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
