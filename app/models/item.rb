class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :item_price, presence: true
  validates :image, presence: true
  PASSWORD_REGEX = /\A[0-9]+\z/.freeze
  validates_format_of :item_price, with: PASSWORD_REGEX
  validates_inclusion_of :item_price, in: 300..9_999_999

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  validates :item_category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_sales_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_shipping_fee_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_scheduled_delivery_id, numericality: { other_than: 1, message: "can't be blank" }
end
