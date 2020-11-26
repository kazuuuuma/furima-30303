class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.create(user_params)
  end

  private

  def user_params
    params.require(:users).permit(:nickname, :email, :family_name, :first_name, :fam_name_furigana, :fst_name_furigana, :birthday)
  end
end
