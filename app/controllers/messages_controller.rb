class MessagesController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    message = Message.create(message_params)
    redirect_to item_path(@item.id)
  end

  def message_params
    params.require(:message).permit(:coment).merge(item_id: @item.id, user_id: current_user.id)
  end
end
