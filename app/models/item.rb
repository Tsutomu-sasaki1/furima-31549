class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options numericality: { other_than: 0 } do
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
  validates :price, presence: true, inclusion: { in: 300..9_999_999 }

  has_one :history
  has_one_attached :image
  belongs_to_active_hash :genre
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :date_of_shipment
  belongs_to_active_hash :shipping_charge
  belongs_to :user
end
