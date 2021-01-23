class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :histories,         dependent: :destroy
  has_many :items,             dependent: :destroy

  validates :name    ,         presence: true, uniqueness: true
  validates :nickname,         presence: true
  validates :name_first,       presence: true
  validates :name_second,      presence: true
  validates :name_kana_first,  presence: true
  validates :name_kana_second, presence: true
  validates :birthday,         presence: true

end
