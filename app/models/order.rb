class Order < ApplicationRecord

  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details
  belongs_to :customer
  
  
  enum status: {nyuukinmati: 0,nyuukinnkakuninn: 1,seisakutyuu: 2,hassouzyunbityuu: 3, hassouzumi: 4}
  enum payment_method: {credit_card: 0, transfer: 1 }

end
