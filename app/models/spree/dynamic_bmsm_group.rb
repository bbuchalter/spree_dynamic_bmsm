class Spree::DynamicBmsmGroup < ActiveRecord::Base
  attr_accessible :name, :description, :number
  has_many :dynamic_bmsm_tiers
  has_many :spree_users, :class_name => "Spree::User"
  validates :number, :presence => true, :uniqueness => true
end
