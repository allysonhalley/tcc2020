class CardRequestsController < ApplicationController
  before_action :set_card_request, only: [:show, :edit, :update, :destroy]

  # GET /card_requests
  # GET /card_requests.json
  def index
    @q = CardRequest.ransack(params[:q])
    @card_requests = @q.result(distinct: true).order(created_at: :desc)
  end

  # GET /card_requests/1
  # GET /card_requests/1.json
  def show
  end

  # GET /card_requests/new
  def new
    @card_request = CardRequest.new
  end

  # GET /card_requests/1/edit
  def edit
  end

  # POST /card_requests
  # POST /card_requests.json
  def create    
    @card_request = CardRequest.new(card_request_params)
    if @card_request.save
      redirect_to card_requests_url, flash: {success: t('activerecord.success.create')}      
    else
      flash.now[:error] = @card_request.errors.full_messages.first
      redirect_to militaries_url, flash: {error: @card_request.errors.full_messages.first }
    end
  end

  # PATCH/PUT /card_requests/1
  # PATCH/PUT /card_requests/1.json
  def update
    if @card_request.update(card_request_params)
      redirect_to @card_request, flash: {success: t('activerecord.success.update')}      
    else
      flash.now[:error] = @card_request.errors.full_messages.first       
      render :edit
    end    
  end

  # DELETE /card_requests/1
  # DELETE /card_requests/1.json
  def destroy
    if @card_request.destroy
      redirect_to card_requests_url, flash: {success: t('activerecord.success.destroy')}
    else
      redirect_to card_requests_url, flash: {error: @card_request.errors.full_messages.first }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_request
      @card_request = CardRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_request_params
      params.require(:card_request).permit(:military_registration, :document_reference, :reason_request)
    end
end
