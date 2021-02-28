class AddressesController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    @item = Item.find(params[:item_id])
    # binding.pry
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    # binding.pry
    params.require(:order).permit(:postal_code, :city, :address, :phone_number, :prefecture_id, :building, :history_id).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

end
