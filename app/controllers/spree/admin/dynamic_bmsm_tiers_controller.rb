class SpreeDynamicBmsmTiersController < ApplicationController
  before_action :set_spree_dynamic_bmsm_tier, only: [:show, :edit, :update, :destroy]

  # GET /spree_dynamic_bmsm_tiers
  def index
    @spree_dynamic_bmsm_tiers = SpreeDynamicBmsmTier.all
  end

  # GET /spree_dynamic_bmsm_tiers/1
  def show
  end

  # GET /spree_dynamic_bmsm_tiers/new
  def new
    @spree_dynamic_bmsm_tier = SpreeDynamicBmsmTier.new
  end

  # GET /spree_dynamic_bmsm_tiers/1/edit
  def edit
  end

  # POST /spree_dynamic_bmsm_tiers
  def create
    @spree_dynamic_bmsm_tier = SpreeDynamicBmsmTier.new(spree_dynamic_bmsm_tier_params)

    if @spree_dynamic_bmsm_tier.save
      redirect_to @spree_dynamic_bmsm_tier, notice: 'Spree dynamic bmsm tier was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /spree_dynamic_bmsm_tiers/1
  def update
    if @spree_dynamic_bmsm_tier.update(spree_dynamic_bmsm_tier_params)
      redirect_to @spree_dynamic_bmsm_tier, notice: 'Spree dynamic bmsm tier was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /spree_dynamic_bmsm_tiers/1
  def destroy
    @spree_dynamic_bmsm_tier.destroy
    redirect_to spree_dynamic_bmsm_tiers_url, notice: 'Spree dynamic bmsm tier was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spree_dynamic_bmsm_tier
      @spree_dynamic_bmsm_tier = SpreeDynamicBmsmTier.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def spree_dynamic_bmsm_tier_params
      params.require(:spree_dynamic_bmsm_tier).permit(:spree_dynamic_bmsm_groups, :label, :level, :discount)
    end
end
