class AddSpreeDynamicBmsmGroupIdToSpreeUsers < ActiveRecord::Migration
  def change
    add_column :spree_users, :spree_dynamic_bmsm_group_id, :integer
  end
end
