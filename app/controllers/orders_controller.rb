class OrdersController < ApplicationController
  before_action :set_item, only: :new
  before_action :authenticate_user!, only: :new 
  def index

  end

  def new
    @orders = Order.all
    @orders.each do |order|
      if order.item.id == @item.id
        return redirect_to root_path
      end
    end
    if current_user.id == @item.user_id
      return redirect_to root_path
    else
      @order = OrderAddress.new
    end  
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :new
    end
  end

  private
  def order_params
    set_item
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :block, :building_name, 
      :phone_number, :token).merge(user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    set_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price_id,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
