class Genre < ApplicationRecord
  validates :name, uniqueness: true
  has_many :items, dependent: :destroy
end
