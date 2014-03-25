class Spree::DynamicBmsmTier < ActiveRecord::Base
  attr_accessible :dynamic_bmsm_group_id, :label, :level, :discount
  belongs_to :spree_dynamic_bmsm_groups
end
