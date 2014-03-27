# check if user is eligible for bmsm tier
module Spree
  class Promotion < Spree::Activator
    module Rules
      class BmsmPromotionRule < PromotionRule
        #preference :min_amount, :decimal, :default => 100.00
        #preference :max_amount, :decimal, :default => 150.00

        #attr_accessible :preferred_min_amount, :preferred_max_amount

        def eligible?(order, options = {})
          user = order.try(:user)
          return false if user.nil?

          item_total = order.line_items_excluding_excluded_products.map(&:amount).sum
          adjustments = order.price_adjustment_totals.map(&:amount).sum
          item_total_after_adjustments = item_total + adjustments

          group = order.user.get_bmsm_group #this assumes that there is a deafult group 1
          
          tiers = Spree::DynamicBmsmTier.where(:dynamic_bmsm_group_id => group).order(:level).reverse_order

          #this will only work if tiers is an ordered list by level
          eligible_level = 0
          tiers.each do | tier|
            if item_total_after_adjustments >= tier.level
              eligible_level = tier.level
              break #only one tier per order. Ordered tier list means we dont need a range.
            end
          end
          Rails.logger.info "[ORDER #{order.number}, Dynamic BMSM promo rule -level:#{eligible_level}] returns #{eligible_level > 0}"
          return eligible_level > 0
        end
      end
    end
  end
end
