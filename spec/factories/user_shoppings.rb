FactoryBot.define do
  factory :user_shopping do
      # Addressesのテーブルに保存
      postal_code  {"151-0073"}
      prefectures_id {14}
      city {"渋谷区笹塚"}
      address_number {"1-2-3"}
      building_name {"ライオンズマンション102"}
      phone_number {"09000000000"}
      record_id {1}
      token {"tok_abcdefghijk00000000000000000"}
  end
end
