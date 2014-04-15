class Spree::DynamicBmsmTier < ActiveRecord::Base
  attr_accessible :dynamic_bmsm_group_id, :label, :level, :discount
  belongs_to :dynamic_bmsm_group

  validates :dynamic_bmsm_group_id, :label, :level, :discount, :presence => true
end
