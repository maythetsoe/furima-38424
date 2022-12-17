class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :detail_category_id, presence: true
  validates :detail_commodity_condition_id, presence: true
  validates :delivery_burden_id, presence: true
  validates :region_id, presence: true
  validates :days_to_ship_id, presence: true
  validates :image, presence: true
  validates :price, presence: true

  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :detail_category
  belongs_to :detail_commodity_condition
  belongs_to :delivery_burden
  belongs_to :region
  belongs_to :days_to_ship


  validates :detail_category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :detail_commodity_condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_burden_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

end


