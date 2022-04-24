class Address < ApplicationRecord
  validates :name,presence:true
  validates :post_number,presence:true
  validates :address,presence:true
  belongs_to :customer

  def address_display
  '〒' + post_number + ' ' + address + ' ' + name
  end

end
