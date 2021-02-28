class OrdersController < ApplicationController
  before_action :orders, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @order = OrderCash.new
    if current_user.id == @item.user_id ||  @item.order.present?
      redirect_to root_path
    end
  end

  def create
    
    @order = OrderCash.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  private

  def order_params
    params.require(:order_cash).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number,:order_id ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def orders
    @item = Item.find(params[:item_id])
  end

  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]

  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: order_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
end

end

