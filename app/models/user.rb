class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  LAST_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates_format_of :last_name, with: LAST_NAME_REGEX
  FIRST_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates_format_of :first_name, with: FIRST_NAME_REGEX
  LAST_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates_format_of :last_name_kana, with: LAST_NAME_KANA_REGEX
  FIRST_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates_format_of :first_name_kana, with: FIRST_NAME_KANA_REGEX
end
