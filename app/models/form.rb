class Form
  include ActiveModel::Model
  attr_accessor :postalcode, :prefecture_id, :municipality, :address, :build, :phonenumber, :user_id, :item_id
  

  with_options presence: true do
    validates :postalcode
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :phonenumber
  end

  def save
    # user = User.create( family_name: family_name, first_name: first_name, fam_name_furigana: fam_name_furigana, fst_name_furigana: fst_name_furigana, birthday: birthday, nickname: nickname)
    # item = Item.create(:nickname, :email, :family_name, :first_name, :fam_name_furigana, :fst_name_furigana, :birthday)
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create(postalcode: postalcode, prefecture_id: prefecture_id, municipality: municipality, address: address, build: build, phonenumber: phonenumber, order_id: order.id)
  end
end