class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def with_tax_price
    (price * 1.1).floor
  end

  def subtotal
    with_tax_price * amount
  end

  enum making_status: { production_not_allowed: 0, waiting_production: 1, production: 2, production_completed: 3 }
end
