class Address < ApplicationRecord
  validates :name,presence:true
  validates :post_number,presence:true
  validates :address,presence:true
  belongs_to :customer

end
