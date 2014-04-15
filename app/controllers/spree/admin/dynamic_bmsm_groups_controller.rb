class Spree::Admin::DynamicBmsmGroupsController < Spree::Admin::BaseController
  before_filter :set_spree_dynamic_bmsm_group, :only => [:edit, :update, :destroy]

  def index
    @spree_dynamic_bmsm_groups = Spree::DynamicBmsmGroup.all
  end

  def new
    @spree_dynamic_bmsm_group = Spree::DynamicBmsmGroup.new
  end

  def edit
    @spree_dynamic_bmsm_group = Spree::DynamicBmsmGroup.find(params[:id])
  end

  def create
    @spree_dynamic_bmsm_group = Spree::DynamicBmsmGroup.new(spree_dynamic_bmsm_group_params)
    if @spree_dynamic_bmsm_group.save
      redirect_to admin_dynamic_bmsm_groups_path, :notice => 'Group was successfully created.'
    else
      render :action => 'new'
    end
  end

  def update
    if @spree_dynamic_bmsm_group.update_attributes(spree_dynamic_bmsm_group_params)
      redirect_to admin_dynamic_bmsm_groups_path, :notice => 'Group was successfully updated.'
    else
      render :action => 'edit'
    end
  end

  def users
    @group = Spree::DynamicBmsmGroup.find(params[:id])
    @users = @group.spree_users
  end

  def update_user_group
    user = Spree::User.find(params[:user][:id])
    group = Spree::DynamicBmsmGroup.find(params[:user][:dynamic_bmsm_group_id])
    user.update_attribute(:dynamic_bmsm_group_id, group.id)
    redirect_to users_admin_dynamic_bmsm_group_path(group), :notice => "#{user.email} assigned to #{group.name}."
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_spree_dynamic_bmsm_group
    @spree_dynamic_bmsm_group = Spree::DynamicBmsmGroup.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def spree_dynamic_bmsm_group_params
    #params.require(:dynamic_bmsm_group).permit(:name, :description)
    params[:dynamic_bmsm_group]
  end
end
