class ItemsController < ApplicationController

  before_action :authenticate_user!, only: :new
  
  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end

  # def
  # end

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
    params.require(:item).permit(:image, :item_name, :category_id, :condition_id, :prefectures_id, :date_of_shipment_id, :price, :shipping_charge_id, :explanation).merge(user_id: current_user.id)
  end
end
