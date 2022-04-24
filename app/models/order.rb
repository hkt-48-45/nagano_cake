class Order < ApplicationRecord

  has_many :order_details, dependent: :destroy
  has_many :items
  belongs_to :customer



  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: {nyuukinmati: 0,nyuukinnkakuninn: 1,seisakutyuu: 2,hassouzyunbityuu: 3, hassouzumi: 4}
  


  def order_display
    "〒" + post_number + " " + address + " " + name
  end

end
