class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  enum making_status: {cannot_be_produced: 0, waiting_for_production: 1, producing: 2, production_completed: 3}
  
end
