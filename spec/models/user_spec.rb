require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation,first_name,last_name,first_name_kana,last_name_kana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
      context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123abc'
      @user.password_confirmation = '123abcd'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordは数字のみでは保存できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'passwordは英字のみでは保存できない' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'samplemail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが6文字以下では登録できない' do
      @user.password = '123ab'
      @user.password_confirmation = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが129文字以上では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end
    it 'passwordは半角英数字混合でないと登録できない' do
      @user.password = '1231234'
      @user.password_confirmation = '1231234'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'お名前(全角)は、名字と名前が空では登録できない' do
      @user.first_name= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'お名前(全角)は、名字と名前が空では登録できない' do
      @user.last_name= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it '全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.first_name= "ﾔﾏﾀﾞ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it '全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.last_name= "ｹﾝﾀﾛｳ" 
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it 'お名前カナ(全角)は、名字と名前が空では登録できない' do
      @user.first_name_kana= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'お名前カナ(全角)は、名字と名前が空では登録できない' do
      @user.last_name_kana= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'お名前カナ(全角)は、全角（カタカナ）でなければ登録できない' do 
      @user.first_name_kana= "やまだ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it 'お名前カナ(全角)は、全角（カタカナ）でなければ登録できない' do 
      @user.last_name_kana= "けんたろう"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it '年月日が空では登録できない' do
      @user.birthday= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
 end
end
end