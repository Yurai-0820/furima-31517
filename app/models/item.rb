class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship

  belongs_to :user
  has_many :comments
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :shipping_charge_id
      validates :days_to_ship_id
    end
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. input harf-width characters.' },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  end
end
