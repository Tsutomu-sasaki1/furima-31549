class AddressesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_find,          only: [:index, :create]
  before_action :user_check,         only: [:index, :create]
  before_action :history_conut,      only: [:index, :create]
  def index
    @order = Order.new    
  end

  def create
    @order = Order.new(order_params)
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
    params.require(:order).permit(:postal_code, :city, :address, :phone_number, :prefecture_id, :building, :history_id).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: @order.token,
      currency: 'jpy'
    )
  end
  
  def item_find
    @item = Item.find(params[:item_id])
  end

  def user_check
    if current_user.id == @item.user_id
        redirect_to root_path
    end
  end

  def history_conut
    if @item.historie.present?
      redirect_to root_path
    end
  end
    
end
