class Item < ApplicationRecord
  belongs_to :user

  validates :product_name, presence: true
  validates :profile, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :prefecture_id, presence: true
  validates :charge_id, presence: true
  validates :days_to_ship_id, presence: true 
  validates :price, presence: true
end
