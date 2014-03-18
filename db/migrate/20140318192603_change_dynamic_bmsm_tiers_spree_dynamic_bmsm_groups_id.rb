class ChangeDynamicBmsmTiersSpreeDynamicBmsmGroupsId < ActiveRecord::Migration
  def self.up
    rename_column :spree_dynamic_bmsm_tiers, :spree_dynamic_bmsm_groups_id, :dynamic_bmsm_group_id
  end
  def self.down
  end
end
