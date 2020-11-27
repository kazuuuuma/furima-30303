class ItemsController < ApplicationController
  

  def index

  end

  def new
    @item = Item.new
  end

  def creste
    @item = Item.new(item_params)
  end

  private

  def prototype_params
    params.require(:item).permit(:product_name, :profile, :category_id, :condition_id, :prefecture_id, :charge_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end


end
