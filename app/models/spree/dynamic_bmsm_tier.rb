class Spree::DynamicBmsmTier < ActiveRecord::Base
  attr_accessible :label, :level, :discount
  belongs_to :spree_dynamic_bmsm_groups
end
