class Form
  include ActiveModel::Model
  attr_accessor :postalcode, :prefecture_id, :municipality, :address, :build, :phonenumber, :user_id, :item_id, :token
  

  with_options presence: true do
    validates :postalcode, format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phonenumber, format: {with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(postalcode: postalcode, prefecture_id: prefecture_id, municipality: municipality, address: address, build: build, phonenumber: phonenumber, order_id: order.id)
  end
end