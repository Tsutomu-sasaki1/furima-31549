class Addresse < ApplicationRecord

  belongs_to :historie, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
