class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :detail

  validates :name, :description, :category_id, :status_id, :postage_id, :regional_id, :shipping_date_id, :price, presence: true

  validates :category_id, :status_id, :postage_id, :regional_id, :shipping_date_id, numericality: { other_than: 1 } 
end
