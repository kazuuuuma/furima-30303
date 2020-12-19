class OrdersController < ApplicationController
  before_action :set_item
  before_action :move_to_sing_in
  before_action :sold_item
  before_action :move_to_index

  def index
    set_item
    @order = Form.new
  end

  def create
    set_item
    @order = Form.new(form_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def form_params
    params.require(:form).permit(:postalcode, :prefecture_id, :municipality, :address, :build, :phonenumber).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,
      card: form_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_sing_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def sold_item
    if user_signed_in? && @item.orders.present?
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
