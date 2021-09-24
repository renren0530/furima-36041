class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    if user_signed_in? && (@item.user.id == current_user.id)
      redirect_to root_path
    elsif @item.order.present?
      redirect_to root_path
    end
    @order_residence = OrderResidence.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_residence = OrderResidence.new(order_params)
    if @order_residence.valid?
      pay_item
      @order_residence.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_residence).permit(:postal_code, :item_prefecture_id, :city, :addresses, :building, :phone_number).merge(
      user_id: current_user.id, token: params[:token], item_id: params[:item_id]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.item_price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
