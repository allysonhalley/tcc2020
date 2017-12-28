# HierarchiesController controla link com view
class HierarchiesController < ApplicationController
  before_action :set_hierarchy, only: %i[show edit update destroy]

  # GET /hierarchies
  # GET /hierarchies.json
  def index
    @q = Hierarchy.ransack(params[:q])
    @hierarchies = @q.result(distinct: true).order(rank: :asc)
  end

  # GET /hierarchies/1
  # GET /hierarchies/1.json
  def show; end

  # GET /hierarchies/new
  def new
    @hierarchy = Hierarchy.new
  end

  # GET /hierarchies/1/edit
  def edit; end

  # POST /hierarchies
  # POST /hierarchies.json
  def create
    @hierarchy = Hierarchy.new(hierarchy_params)
    if @hierarchy.save
      redirect_to @hierarchy, flash: { success: t('activerecord.success.create') }
    else
      flash.now[:error] = @hierarchy.errors.full_messages.first
      render :new
    end
  end

  # PATCH/PUT /hierarchies/1
  # PATCH/PUT /hierarchies/1.json
  def update
    if @hierarchy.update(hierarchy_params)
      redirect_to @hierarchy, flash: { success: t('activerecord.success.update') }
    else
      flash.now[:error] = @hierarchy.errors.full_messages.first
      render :edit
    end
  end

  # DELETE /hierarchies/1
  # DELETE /hierarchies/1.json
  def destroy
    if @hierarchy.destroy
      redirect_to hierarchies_url, flash: { success: t('activerecord.success.destroy') }
    else
      redirect_to hierarchies_url, flash: { error: @hierarchy.errors.full_messages.first }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_hierarchy
    @hierarchy = Hierarchy.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def hierarchy_params
    params.require(:hierarchy).permit(:name, :acronym, :rank)
  end
end
