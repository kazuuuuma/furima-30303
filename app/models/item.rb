class Item < ApplicationRecord
  belongs_to :user
  ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :days_to_ship

  has_one_attached :image

  validates :price, presence: true, format: { with: /\A[0-9]+\z/, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999,  message: '半角数字を使用してください' }

  with_options presence: true do
    validates :product_name
    validates :profile
    validates :category_id
    validates :condition_id
    validates :prefecture_id
    validates :charge_id
    validates :days_to_ship_id
    validates :image
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id 
    validates :condition_id 
    validates :charge_id 
    validates :prefecture_id 
    validates :days_to_ship_id
  end
end
