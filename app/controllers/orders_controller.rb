class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :action, only:[:index, :create] 

  def index
    if @item.order.present? || @item.user.id == current_user.id
      redirect_to root_path
    end  
    @order_residence = OrderResidence.new
  end

  def create  
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
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  
    Payjp::Charge.create(
      amount: @item.item_price, 
      card: order_params[:token], 
      currency: 'jpy'                
    )
  end

  def action  
    @item = Item.find(params[:item_id])
  end
end
