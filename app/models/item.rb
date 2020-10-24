class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :regional
  belongs_to_active_hash :shipping_date

  validates :name, :description, :category_id, :status_id, :postage_id, :regional_id, :shipping_date_id, :price, presence: true

  validates :category_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 
  validates :regional_id, numericality: { other_than: 1 } 
  validates :shipping_date_id, numericality: { other_than: 1 } 
end
