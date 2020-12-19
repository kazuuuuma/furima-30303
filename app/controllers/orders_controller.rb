class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = Form.new
  end

  def create
    @item = Item.find(params[:item_id])
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
end
