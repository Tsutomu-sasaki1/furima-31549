class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :histories,         dependent: :destroy
  has_many :items,             dependent: :destroy

  validates :nickname,         presence: true
  validates :name_first,       presence: true
  validates :name_second,      presence: true
  validates :name_kana_first,  presence: true
  validates :name_kana_second, presence: true
  validates :birthday,              presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
end
