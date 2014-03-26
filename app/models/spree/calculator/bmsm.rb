module Spree
  class Calculator::Bmsm < Calculator
    def self.description
      I18n.t(:bmsm_calculator_description)
    end

    def compute(object)
      if object.is_a?(Array)
        return if object.empty?
        order = object.first.order
      else
        order = object
      end

      item_total = order.line_items_excluding_excluded_products.map(&:amount).sum
      adjustments = order.price_adjustment_totals.map(&:amount).sum
      item_total_after_adjustments = item_total + adjustments

      group = order.user.get_bmsm_group #this assumes that there is a deafult group 1

      tiers = Spree::DynamicBmsmTier.where(:dynamic_bmsm_group_id => group).order(:level).reverse_order

      #this will only work if tiers is an ordered list by level
      discount = 0
      eligible_level = 0
      tiers.each do | tier|
        if item_total_after_adjustments >= tier.level
          eligible_level = tier.level
          discount = 0 - item_total * (tier.discount / 100) #the tier discount is kep inthe the db as a % need to divide by 100 to get to dollar amount
          break #only one tier per order. Ordered tier list means we dont need a range.
        end
      end
      Rails.logger.info "[ORDER #{order.number}, Dynamic BMSM Calculator: level:#{eligible_level}] : discount:#{discount}  "

      return discount
    end
  end
end
