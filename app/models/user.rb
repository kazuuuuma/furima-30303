class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください' } do
    validates :family_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' } do
    validates :fam_name_furigana
    validates :fst_name_furigana
  end
  with_options presence: true do
    validates :nickname
    validates :birthday
  end
  validates :email, uniqueness: true
  

  has_many :items
  has_many :user_items
end
