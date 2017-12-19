# Classe controla funcoes referentes aos militares
class MilitariesController < ApplicationController
  before_action :set_military, only: %i[show edit update destroy]

  # GET /militaries
  # GET /militaries.json
  def index
    @q = Military.ransack(params[:q])
    @militaries = @q.result(distinct: true).order(name: :asc)
  end

  # GET /militaries/1
  # GET /militaries/1.json
  def show; end

  # GET /militaries/new
  def new
    @military = Military.new
  end

  # GET /militaries/1/edit
  def edit; end

  # POST /militaries
  # POST /militaries.json
  def create
    @military = Military.new(military_params)
    if @military.save
      redirect_to @military, flash: {success: t('activerecord.success.create')}
    else         
      flash.now[:error] = @military.errors.full_messages.first       
      render :new
    end
  end

  # PATCH/PUT /militaries/1
  # PATCH/PUT /militaries/1.json
  def update 
    if @military.update(military_params)
      redirect_to @military, flash: {success: t('activerecord.success.update')}      
    else
      flash.now[:error] = @military.errors.full_messages.first       
      render :edit
    end
  end

  # DELETE /militaries/1
  # DELETE /militaries/1.json
  def destroy    
    if @military.destroy    
        redirect_to militaries_url, flash: {success: t('activerecord.success.destroy')}    
    else    
      redirect_to militaries_url, flash: {error: @military.errors.full_messages.first }    
    end    
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_military
    @military = Military.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def military_params
    params.require(:military).permit(:name, :identification, :hierarchy_id, :father_name, :mother_name, :born_date, :registration, :naturalness, :vote_number, :vote_zone, :vote_section, :cpf, :digital_factor, :blood_type, :blood_factor, :firearm)
  end
end
