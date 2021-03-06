class ItemsController < ApplicationController
  before_action :move_to_sing_in, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :sold_item, only: [:edit, :update]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :profile, :category_id, :condition_id, :prefecture_id, :charge_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_sing_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def sold_item
    if @item.orders.present?
      redirect_to root_path
    end
  end
end
