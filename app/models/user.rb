class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :fam_name_furigana, presence: true
  validates :fst_name_furigana, presence: true
  validates :birthday, presence: true
end