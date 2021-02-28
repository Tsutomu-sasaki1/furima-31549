# class CardsController < ApplicationController

#   def create
#     @card = Card.new(card_params)
    
#     if @card.save
#       redirect_to root_path
#     end
#   end

#   private

#   def card_params
#     params.require(:order).permit(:created_at).merge(token: params[:token])
#   end
  
# end
