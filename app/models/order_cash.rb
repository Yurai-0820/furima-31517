class OrderCash
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :postal_code
    validates :municipality
    validates :address
    validates :token
    validates :phone_number
    validates :item_id
    validates :user_id
  end
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'number Input only number' }
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'code Input correctly' }
  validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }

  def save
    # 購入情報
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報
    Purchaser.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address,
                     building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
