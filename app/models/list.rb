# class List < ApplicationRecord
#   extend ActiveHash::Associations::ActiveRecordExtensions
#   belongs_to :genre, :item
  
#   validates :category, :condition, :date_of_shipment,
#             :prefectures, :shipping_charge, presence: true

#   #ジャンルの選択が「--」の時は無効
#   validates :genre_id, :numericality: { other_than: 1 }
# end
