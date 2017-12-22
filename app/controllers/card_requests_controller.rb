class CardRequestsController < ApplicationController
  before_action :set_card_request, only: [:show, :edit, :update, :destroy]

  # GET /card_requests
  # GET /card_requests.json
  def index
    @card_requests = CardRequest.all
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

    respond_to do |format|
      if @card_request.save
        format.html { redirect_to @card_request, notice: 'Card request was successfully created.' }
        format.json { render :show, status: :created, location: @card_request }
      else
        format.html { render :new }
        format.json { render json: @card_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_requests/1
  # PATCH/PUT /card_requests/1.json
  def update
    respond_to do |format|
      if @card_request.update(card_request_params)
        format.html { redirect_to @card_request, notice: 'Card request was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_request }
      else
        format.html { render :edit }
        format.json { render json: @card_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_requests/1
  # DELETE /card_requests/1.json
  def destroy
    @card_request.destroy
    respond_to do |format|
      format.html { redirect_to card_requests_url, notice: 'Card request was successfully destroyed.' }
      format.json { head :no_content }
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
