class Spree::DynamicBmsmGroup < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :spree_dynamic_bmsm_tiers
  has_many :spree_users
end
