class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
  enum making_status: {seisakufuka: 0,seisakumati: 1,seisakutyuu: 2,seisakukanryou: 3}
end
