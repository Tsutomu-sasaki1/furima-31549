class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :find_params, only:        [:show, :update, :edit, :destroy]
  before_action :user_check, only:         [:update, :edit, :destroy]

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
  end

  def update
    if @item.update(item_params)
      render :show
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  # def
  # end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :category_id, :condition_id, :prefecture_id, :date_of_shipment_id, :price,
                                 :shipping_charge_id, :explanation).merge(user_id: current_user.id)
  end

  def find_params
    @item = Item.find(params[:id])
  end
 
  def user_check
    redirect_to root_path unless @item.user.id == current_user.id
  end

end
