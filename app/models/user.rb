class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email
    validates :encrypted_password
    validates :family_name
    validates :first_name
    validates :fam_name_furigana
    validates :fst_name_furigana
    validates :birthday
  end

  has_many :items
  has_many :orders
end
