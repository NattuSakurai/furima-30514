require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it "nickname,email,password,password_confirmation,first_name,last_name,first_name_kana,last_name_kana,birthdayが存在すれば登録ができる" do
        expect(@user).to be_valid
        
      end

      it "nicknameが40文字以下で登録ができる" do
        @user.nickname = "sample"
        expect(@user).to be_valid
      end

      it "emailは、@を含んでいると登録ができる" do
        @user.email = "sample@gmail.com"
        expect(@user).to be_valid
      end

      it "passwordは、6文字以上,半角英数字混合で登録ができる" do
        @user.password = "password1"
        @user.password_confirmation = "password1"
        expect(@user).to be_valid
      end

      it "password,password_confirmationの値が一致で登録ができる" do
        @user.password = "password1"
        @user.password_confirmation = "password1"
        expect(@user).to be_valid
      end
      
      it "first_nameは全角(漢字・ひらがな・カタカナ)であると登録ができる" do
        @user.first_name = "佐藤"
        expect(@user).to be_valid
      
      end

      it "last_nameは全角(漢字・ひらがな・カタカナ)であると登録ができる" do
        @user.last_name = "太郎"
        expect(@user).to be_valid
      end

      it "first_name_kanaは全角(カタカナ)であると登録ができる" do
        @user.first_name_kana = "サトウ"
        expect(@user).to be_valid
      end

      it "last_name_kanaは全角(カタカナ)であると登録ができる" do
        @user.last_name_kana = "タロウ"
        expect(@user).to be_valid
      end
    
    end
    context '新規登録がうまく出来ない時' do
      it "nicknameが空だと登録ができない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "nicknameが41文字以上だと登録できない" do
        @user.nickname = '123456789012345678901234567890123456789012'
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 40 characters)")
      end

      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "すでに登録されているemailは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailに@が含まれていなければ登録ができない" do
        @user.email = 'sample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下だと登録ができない" do
        @user.password = 'pass'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordに半角英数混合でなければ登録できない" do
        @user.password = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "password_confirmationが空だと登録できない" do
      end

      it "password,password_confirmationの値が一致しなければ登録できない" do
        @user.password = 'password1'
        @user.password_confirmation = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "first_nameは全角(漢字・ひらがな・カタカナ)でなければ登録できない" do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "last_nameが空だと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "last_nameは全角(漢字・ひらがな・カタカナ)でなければ登録できない" do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "first_name_kanaは全角(カタカナ)でなければ登録できない" do
        @user.first_name_kana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "last_name_kanaは全角(カタカナ)でなければ登録できない" do
        @user.last_name_kana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "birthdayが空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end

  end
end