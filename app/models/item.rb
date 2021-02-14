class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
  has_many :comments
  has_one :order
  has_one_attached :image


  with_options presence: true do
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 } 
    validates :condition_id, numericality: { other_than: 1 } 
    validates :shipping_charge_id, numericality: { other_than: 1 } 
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :days_to_ship_id, numericality: { other_than: 1 } 
    validates :price
  end
end
