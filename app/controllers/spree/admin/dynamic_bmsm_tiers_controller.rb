class Spree::Admin::DynamicBmsmTiersController < Spree::Admin::BaseController
  before_filter :set_dynamic_bmsm_tier, :only => [:edit, :update, :destroy]

  def index
    group_id = params[:group_id]
    if group_id.present? && group_id.to_i >0
      @spree_dynamic_bmsm_tiers = Spree::DynamicBmsmTier.where(:dynamic_bmsm_group_id => group_id.to_i)
    else
      @spree_dynamic_bmsm_tiers = Spree::DynamicBmsmTier.all
    end
  end

  def new
    @spree_dynamic_bmsm_tier = Spree::DynamicBmsmTier.new
  end

  def edit
    @spree_dynamic_bmsm_tier = Spree::DynamicBmsmTier.find(params[:id])
  end

  def create
    @spree_dynamic_bmsm_tier = Spree::DynamicBmsmTier.new(spree_dynamic_bmsm_tier_params)
    if @spree_dynamic_bmsm_tier.save
      redirect_to admin_dynamic_bmsm_tiers_path, :notice => 'Tier was successfully created.'
    else
      render :action => 'new'
    end
  end

  def update
    if @spree_dynamic_bmsm_tier.update_attributes(spree_dynamic_bmsm_tier_params)
      redirect_to admin_dynamic_bmsm_tiers_path, notice: 'Tier was successfully updated.'
    else
      render :action => 'edit'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dynamic_bmsm_tier
      @spree_dynamic_bmsm_tier = Spree::DynamicBmsmTier.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def spree_dynamic_bmsm_tier_params
      #params.require(:dynamic_bmsm_tier).permit(:dynamic_bmsm_groups, :label, :level, :discount)
      params[:dynamic_bmsm_tier]
    end
end
