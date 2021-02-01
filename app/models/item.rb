class Item < ApplicationRecord
  validates :item_name,            presence: true
  validates :category_id,          presence: true
  validates :condition_id,         presence: true
  validates :prefectures_id,       presence: true
  validates :date_of_shipment_id,  presence: true
  validates :price,                presence: true
  validates :shipping_charge_id,   presence: true
  validates :explanation,          presence: true

  has_one :history, :list
  belongs_to :user
  has_one_attached :image
end
