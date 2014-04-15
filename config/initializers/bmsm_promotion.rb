config = Rails.application.config
config.after_initialize do
  config.spree.promotions.rules << BmsmPromotionRule
  config.spree.calculators.promotion_actions_create_adjustments << Spree::Calculator::Bmsm
end

