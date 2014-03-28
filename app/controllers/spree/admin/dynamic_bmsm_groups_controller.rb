class Spree::Admin::DynamicBmsmGroupsController < Spree::Admin::BaseController
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
    @spree_dynamic_bmsm_group = Spree::DynamicBmsmGroup.find(params[:id])
  end

  # POST /spree_dynamic_bmsm_groups
  def create
    @spree_dynamic_bmsm_group = Spree::DynamicBmsmGroup.new(spree_dynamic_bmsm_group_params)
    if @spree_dynamic_bmsm_group.save
      redirect_to admin_dynamic_bmsm_group_path(@spree_dynamic_bmsm_group), notice: 'Spree dynamic bmsm group was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /spree_dynamic_bmsm_groups/1
  def update
    if @spree_dynamic_bmsm_group.update_attributes(spree_dynamic_bmsm_group_params)
      redirect_to admin_dynamic_bmsm_group_path(@spree_dynamic_bmsm_group), notice: 'Spree dynamic bmsm group was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /spree_dynamic_bmsm_groups/1
  def destroy
    @spree_dynamic_bmsm_group.destroy
    redirect_to admin_dynamic_bmsm_groups_path, notice: 'Spree dynamic bmsm group was successfully destroyed.'
  end

  def users
    @spree_dynamic_bmsm_group_users =  Spree::User.where(:spree_dynamic_bmsm_group_id => params[:group_id])

    @spree_dynamic_bmsm_groups = Spree::DynamicBmsmGroup.all
  end

  def update_user_group
    #show dropdown form for changing user group
    user_id = params[:user][:user_id]
    user = Spree::User.find(user_id)
    group = params[:user][:spree_dynamic_bmsm_group_id]
    @spree_dynamic_bmsm_group_users =  Spree::User.where(:spree_dynamic_bmsm_group_id => group)
    @spree_dynamic_bmsm_groups = Spree::DynamicBmsmGroup.all
    if user.present? && group.present?
      if user.update_attribute(:spree_dynamic_bmsm_group_id, group)
        render action: 'users', notice: 'Users bmsm group was successfully updated.'
        #redirect_to admin_dynamic_bmsm_group_path, notice: 'Users bmsm group was successfully updated.'
      end
    else
      render action: 'users'
    end

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
