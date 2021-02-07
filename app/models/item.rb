class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :item_name,            presence: true
  validates :category_id,          presence: true, numericality: { other_than: 1}
  validates :condition_id,         presence: true, numericality: { other_than: 1}
  validates :prefectures_id,       presence: true, numericality: { other_than: 1}
  validates :date_of_shipment_id,  presence: true, numericality: { other_than: 1}
  validates :shipping_charge_id,   presence: true, numericality: { other_than: 1}
  validates :price,                presence: true, inclusion: { in: 300..9999999  }
  validates :explanation,          presence: true
  #ジャンルの選択が「--」の時は無効

  has_one :history
  has_one_attached :image
  belongs_to :genre, :prefecture, :condition, :dateofshipment, :shippingharge, :user

end
