class OrdersController < ApplicationController

  def index

  end

  def new
    if user_signed_in?
      @item = Item.find(params[:item_id])
      if current_user.id == @item.user_id
        redirect_to root_path
      else
        @order = OrderAddress.new
      end

    else
      redirect_to new_user_session_path
    end
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render :new
    end
  end


  def order_params
    @item = Item.find(params[:item_id])
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :block, :building_name, 
      :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end


end
