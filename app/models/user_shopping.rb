class UserShopping
  include ActiveModel::Model
  
  after_accessor :postal_code, :prefectures_id, :city, :address_number, :building_name, :phone_number, :user_id, :item_id
  # 配送先のバリデーション
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefectures_id, numericality: { other_than: 1 }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :address_number
    validates :phone_number
  end

  def save
    # 配送先の情報
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address_number: address_number, building_name: building_name, phone_number: phone_number)

    #recordに保存する情報
    Record.create(user_id: user_id, item_id: item_id)
  end
end