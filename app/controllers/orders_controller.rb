class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Form.new(form_params)
    if @order.valid?
      @order.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private
  def form_params
    params.permit(:postalcode, :prefecture_id, :municipality, :address, :build, :phonenumber).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
