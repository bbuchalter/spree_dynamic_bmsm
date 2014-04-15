class BmsmPromotionRule < Spree::PromotionRule
  def eligible?(order, options = {})
    tier = order.dynamic_bmsm_tier
    user = order.try(:user) || options[:user]

    eligible = tier.present? && user.buy_more_save_more?
    Rails.logger.info "[ORDER #{order.number}, Dynamic BMSM promo rule -level:#{tier.level}, group: #{tier.dynamic_bmsm_group_id}, User BMSM?: #{user.buy_more_save_more?}] returns #{eligible}"
    return eligible
  end
end
