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

      tier = order.dynamic_bmsm_tier
      return 0 if tier.nil?

      relevant_order_total = order.item_total_after_adjustments_and_exclusion
      discount_amount = relevant_order_total * (tier.discount / 100) * -1

      Rails.logger.info "[ORDER #{order.number}, Dynamic BMSM Calculator: level:#{tier.level}] : discount:#{discount_amount}  "
      return discount_amount
    end
  end
end
