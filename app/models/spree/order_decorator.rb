Spree::Order.class_eval do
  def dynamic_bmsm_tier
    return nil if user.nil?

    tiers = user.dynamic_bmsm_tiers.reverse_order
    relevant_order_total = item_total_after_adjustments_and_exclusion

    tiers.detect do |tier|
      relevant_order_total >= tier.level
    end
  end
end
