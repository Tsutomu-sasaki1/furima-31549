class AddressesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    @item = Item.find(params[:item_id])
    # binding.pry
    if @order.valid?
      pay_item
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

  def pay_item
    Payjp.api_key = "sk_test_6398103de3d4972d690629ea"
    Payjp::Charge.create(
      amount: @item.price,
      card: @order.token,
      currency: 'jpy'
    )
  end

end
