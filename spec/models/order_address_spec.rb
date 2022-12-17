require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe 'orderの保存' do
    before do
      @item = FactoryBot.create(:item)
      @user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも購入できること' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと購入できないこと' do
        @order_address.post_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'region_idに「---」が選択されている場合は購入できない' do
        @order_address.region_id = '1'
        @order_address.valid?
       expect(@order_address.errors.full_messages).to include "Region can't be blank"
       end
      it 'cityが空だと保存できないこと' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numが半角のハイフンを含んだと購入できないこと' do
        @order_address.phone_num = '090-1111-2222'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num is invalid")
      end
      it 'phone_numが空だと購入できないこと' do
        @order_address.phone_num = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'phone_numが9文字以下では登録できない' do
        @order_address.phone_num = '12345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num is invalid")
      end
      it 'phone_numが12文字以上では登録できない' do
        @order_address.phone_num = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num is invalid")
      end
      it 'phone_numが数字でなければ購入できないこと' do
        @order_address.phone_num = 'abcdfnad'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num is invalid")
      end
      it "tokenが空では登録できないこと" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'item_idが紐付いていないと購入できないこと' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include()
      end
      it 'user_idが紐付いていないと購入できないこと' do
       @order_address.user_id = nil
      @order_address.valid?
       expect(@order_address.errors.full_messages).to include()
      end
    end
  end
end

