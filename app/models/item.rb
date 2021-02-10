class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options  numericality: { other_than: 1} do
    validates :category_id          
    validates :condition_id         
    validates :prefectures_id       
    validates :date_of_shipment_id  
    validates :shipping_charge_id   
  end
  with_options presence: true do
    validates :category_id         
    validates :condition_id        
    validates :prefectures_id      
    validates :date_of_shipment_id 
    validates :shipping_charge_id  
    validates :item_name           
    validates :explanation         
    validates :image      
  end         
  validates :price,                presence: true, inclusion: { in: 300..9999999  }

  has_one :history
  has_one_attached :image
  belongs_to :genre
  belongs_to :prefecture 
  belongs_to :condition 
  belongs_to :date_of_shipment 
  belongs_to :shipping_charge 
  belongs_to :user
end
