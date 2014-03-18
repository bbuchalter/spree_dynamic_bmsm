class Spree::Admin::DynamicBmsmGroupsController < ApplicationController
  before_filter :set_spree_dynamic_bmsm_group, only: [:show, :edit, :update, :destroy]

  # GET /spree_dynamic_bmsm_groups
  def index
    @spree_dynamic_bmsm_groups = Spree::DynamicBmsmGroup.all
  end

  # GET /spree_dynamic_bmsm_groups/1
  def show
  end

  # GET /spree_dynamic_bmsm_groups/new
  def new
    @spree_dynamic_bmsm_group = Spree::DynamicBmsmGroup.new
  end

  # GET /spree_dynamic_bmsm_groups/1/edit
  def edit
  end

  # POST /spree_dynamic_bmsm_groups
  def create
    @spree_dynamic_bmsm_group = Spree::DynamicBmsmGroup.new(spree_dynamic_bmsm_group_params)

    if @spree_dynamic_bmsm_group.save
      redirect_to @spree_dynamic_bmsm_group, notice: 'Spree dynamic bmsm group was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /spree_dynamic_bmsm_groups/1
  def update
    if @spree_dynamic_bmsm_group.update(spree_dynamic_bmsm_group_params)
      redirect_to @spree_dynamic_bmsm_group, notice: 'Spree dynamic bmsm group was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /spree_dynamic_bmsm_groups/1
  def destroy
    @spree_dynamic_bmsm_group.destroy
    redirect_to spree_dynamic_bmsm_groups_url, notice: 'Spree dynamic bmsm group was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spree_dynamic_bmsm_group
      @spree_dynamic_bmsm_group = Spree::DynamicBmsmGroup.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def spree_dynamic_bmsm_group_params
      #params.require(:dynamic_bmsm_group).permit(:name, :description)
      params
    end
end
