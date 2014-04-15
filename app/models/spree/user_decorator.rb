Spree::User.class_eval do
  belongs_to :dynamic_bmsm_group
  has_many :dynamic_bmsm_tiers, :through => :dynamic_bmsm_group, :order => "level"
  attr_accessible :dynamic_bmsm_group_id
  before_create :assign_random_bmsm_group, :if => :bmsm_group_required?

  def assign_random_bmsm_group
    groups = Spree::DynamicBmsmGroup.includes(:dynamic_bmsm_tiers)
    groups.reject! { |g| g.dynamic_bmsm_tiers.empty? }
    self.dynamic_bmsm_group = groups.sample
  end

  def bmsm_group_required?
    dynamic_bmsm_group.blank?
  end
end
