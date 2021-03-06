class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :last_name, length: { minimum: 1, maximum: 20 }
  # validates :first_name, length: { minimum: 1, maximum: 20 }
  # validates :last_name_kana, length: { minimum: 1, maximum: 20 }
  # validates :email, length: { minimum: 1, maximum: 20 }
  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders

 # 退会済ユーザーをブロック
  def active_for_authentication?
    super && (is_deleted == false)
  end
end
