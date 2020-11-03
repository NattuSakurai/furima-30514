class UserShopping
  include ActiveModel::Model
  
  attr_accessor :postal_code, :prefectures_id, :city, :address_number, :building_name, :phone_number, :user_id, :item_id, :record_id, :token
    # 配送先のバリデーション
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefectures_id, numericality: { other_than: 1 }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :address_number
    validates :phone_number, format:{ with: /0\d{10}/}
    validates :token
  end

  def save
    #recordに保存する情報
    record = Record.create(user_id: user_id, item_id: item_id)

    # 配送先の情報
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address_number: address_number, building_name: building_name, phone_number: phone_number, record_id: record.id)

    #カードの情報
    
  end
end