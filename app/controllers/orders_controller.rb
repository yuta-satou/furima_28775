class OrdersController < ApplicationController

  def index

  end

  def new
    if user_signed_in?
      @item = Item.find(params[:item_id])
      if current_user.id == @item.user_id
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end
  end

end
