class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

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

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      render :show
    else
      render :edit
    end
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless @item.user.id == current_user.id
  end

  # def
  # end

  # def
  # end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :category_id, :condition_id, :prefecture_id, :date_of_shipment_id, :price,
                                 :shipping_charge_id, :explanation).merge(user_id: current_user.id)
  end
end
