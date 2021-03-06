class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
    @orders = Order.all
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      return redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
       return redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def show
    @orders = Order.all
    @messages = @item.message.includes(:user)
    @message = Message.new
  end

  def destroy
    if @item.destroy
      return redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id,
                                :delivery_change_burden_id, :prefecture_id, :days_up_to_delivery_id, :price_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
