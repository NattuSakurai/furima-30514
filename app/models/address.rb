class Address < ApplicationRecord
  belongs_to :record
  
  validates :postal_code, presence: true
  validates :prefectures_id, presence: true
  validates :city, presence: true
  validates :address_number, presence: true
  validates :phone_number, presence: true
  validates :record, presence: true
end
