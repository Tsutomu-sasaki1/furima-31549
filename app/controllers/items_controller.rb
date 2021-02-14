class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  # 通話が切れてしまったいますね。
  # zoomで対応できますがいかがでしょうか？
  # 了解です
  # https://zoom.us/j/8865739237?pwd=WEJNNHZiRHphQytTdkgyNmZ4cGkvQT09 
  # kotiranionegaiitasimasu 
  # 入室してみます
  def show
    @item = Item.find(params[:id])
  end

  # def
  # end

  # def
  # end

  # def
  # end

  # def
  # end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :category_id, :condition_id, :prefecture_id, :date_of_shipment_id, :price,:shipping_charge_id, :explanation).merge(user_id: current_user.id)
  end
end
