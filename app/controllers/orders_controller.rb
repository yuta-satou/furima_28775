class OrdersController < ApplicationController

  def index

  end

  def new
    @item = Item.find(params[:item_id])
  end
end
