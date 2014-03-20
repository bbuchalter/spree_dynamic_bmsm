class Spree::DynamicBmsmGroup < ActiveRecord::Base
  has_many :spree_dynamic_bmsm_tiers

  attr_accessible :name, :description
end
