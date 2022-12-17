class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: { production_not_allowed: 0, waiting_production: 1, production: 2, production_completed: 3 }
end
