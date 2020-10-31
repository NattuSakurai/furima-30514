require 'rails_helper'
RSpec.describe UserShopping, type: :model do
  describe '配送先の情報の保存'do
    before do
      @user_shopping = FactoryBot.build(:user_shopping)
    end
    it'すべての値が正しく入力されていれば保存できる'do
      expect(@user_shopping).to be_valid
    end
    it 'postal_codeが空の場合保存できない' do
      @user_shopping.postal_code = ''
      @user_shopping.valid?
      expect(@user_shopping.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにハイフンが含まれていなければ登録できない' do
      @user_shopping.postal_code = 1510073
      @user_shopping.valid?
      expect(@user_shopping.errors.full_messages).to include("Postal code is invalid")
    end
    it 'prefectures_idがid:1の場合保存出来ない' do
      @user_shopping.prefectures_id = 1
      @user_shopping.valid?
      expect(@user_shopping.errors.full_messages).to include("Prefectures must be other than 1")
    end
    it 'cityが空の場合保存できない' do
      @user_shopping.city = ''
      @user_shopping.valid?
      expect(@user_shopping.errors.full_messages).to include("City can't be blank")
    end
    it 'address_numberが空の場合保存できない' do
      @user_shopping.address_number = ''
      @user_shopping.valid?
      expect(@user_shopping.errors.full_messages).to include("Address number can't be blank")
    end
    it 'phone_numberが空の場合保存できない' do
      @user_shopping.phone_number = ''
      @user_shopping.valid?
      expect(@user_shopping.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberにハイフンが含まれていたら保存できない' do
      @user_shopping.phone_number = '090-0000-0000'
      @user_shopping.valid?
      expect(@user_shopping.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
