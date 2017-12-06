# HierarchiesController controlla link com view
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
    respond_to do |format|
      if @hierarchy.save
        format.html do
          redirect_to @hierarchy, flash: {success: t('activerecord.success.create')}
        end
      else
        redirect_to new_hierarchy_url, flash: {error: @hierarchy.errors.full_messages.first }
      end
    end
  end

  # PATCH/PUT /hierarchies/1
  # PATCH/PUT /hierarchies/1.json
  def update
    respond_to do |format|
      if @hierarchy.update(hierarchy_params)
        format.html do
          redirect_to @hierarchy, flash: {success: t('activerecord.success.update')}
        end
      else
        redirect_to edit_hierarchy_url, flash: {error: @hierarchy.errors.full_messages.first }
      end
    end
  end

  # DELETE /hierarchies/1
  # DELETE /hierarchies/1.json
  def destroy
    respond_to do |format|
      if @hierarchy.destroy
        format.html do
          redirect_to hierarchies_url, flash: {success: t('activerecord.success.destroy')}
        end
      else
        format.html do
          redirect_to hierarchies_url, flash: {error: @hierarchy.errors.full_messages.first }
        end
      end
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
