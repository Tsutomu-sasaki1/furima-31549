class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :histories,         dependent: :destroy
  has_many :items,             dependent: :destroy

  validates :birthday, :nickname,              presence: true

  # 全角ひらがな、全角カタカナ、漢字（鬼車）のみ
  NAME_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/.freeze
  validates_format_of :name_first, :name_second,            presence: true, with: NAME_REGEX

  # 全角カタカナのみ
  NAME_KANA_REGEX =/\A[ァ-ヶー－]+\z/.freeze
  validates_format_of :name_kana_first, :name_kana_second,  presence: true, with: NAME_KANA_REGEX

  #半角英数字混合のみ
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  
end
