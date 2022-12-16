class OrderAddress
  include ActiveModel::Model
  attr_accessor :token
  attr_accessor :item_id, :user_id, :post_code, :region_id, :city, :address, :building_name, :phone_num, :order_id

  with_options presence: true do
    validates :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone_num, format: {with: /\A\d{10,11}\z/ }
  end
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, region_id: region_id, city: city, address: address, building_name: building_name, phone_num: phone_num, order_id: order.id)
  end
end