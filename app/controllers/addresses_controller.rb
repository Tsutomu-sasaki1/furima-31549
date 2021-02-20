class AddressesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  # def create
    # @addresse = Addresse.new
  # end
# 
  # private
# 
  # def addresse_params
    # params.require(:addresse).permit(:postal_code, :city, :address, :phone_number, :prefecture_id).merge(user_id: current_user.id)
  # end
end
