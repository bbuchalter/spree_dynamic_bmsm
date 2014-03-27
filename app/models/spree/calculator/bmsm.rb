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

      user = order.try(:user)
      return 0 if user.nil?

      group = order.user.get_bmsm_group #this assumes that there is a deafult group 1

      tiers = Spree::DynamicBmsmTier.where(:dynamic_bmsm_group_id => group).order(:level).reverse_order

      #this will only work if tiers is an ordered list by level
      discount_amount = 0
      eligible_level = 0
      eligible_discount = 0
      tiers.each do | tier|
        if item_total_after_adjustments >= tier.level
          eligible_level = tier.level
          eligible_discount = tier.discount
          discount_amount = 0 - item_total * (tier.discount / 100) #the tier discount is kep inthe the db as a % need to divide by 100 to get to dollar amount
          break #only one tier per order. Ordered tier list means we dont need a range.
        end
      end
      if eligible_level > 0
        #Should probably do this in order_decorator model, but lets see what happens
        eligible_adjustments = order.adjustments.promotion
        eligible_adjustments.each do |adjustment|
          #promo_name = adjustment.label.match(/^Promotion \((Buy more save more)/).try(:[], 1)
          if promo_name = adjustment.label.match(/^(Promotion \(Dynamic BMSM\))$/).try(:[], 1)
            if promo_name.sub!(/Dynamic BMSM\)/,"Buy More Save More #{eligible_discount.to_int}%)")
              adjustment.update_column(:label,promo_name)
            end
          end
          if promo_name = adjustment.label.match(/^(Promotion \(Buy More Save More.*\))$/).try(:[], 1)
            if promo_name.sub!(/Buy More Save More.*\)/,"Buy More Save More #{eligible_discount.to_int}%)")
              adjustment.update_column(:label,promo_name)
            end
          end
        end
      #
      end 
      Rails.logger.info "[ORDER #{order.number}, Dynamic BMSM Calculator: level:#{eligible_level}] : discount:#{discount_amount}  "

      return discount_amount
    end
  end
end
