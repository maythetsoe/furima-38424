require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context '出品できるとき' do
      it 'nameとdescription, detail_category_id, detail_commodity_condition_id, delivery_burden_id, region_id, days_to_ship_id, price, imageが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it 'nameが空では出品できない' do
        @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end
    it 'imageが空では出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it 'descriptionが空では出品できない' do
      @item.description = nil
    @item.valid?
    expect(@item.errors.full_messages).to include "Description can't be blank"
  end
  it 'detail_category_idが空では出品できない' do
    @item.detail_category_id = nil
  @item.valid?
  expect(@item.errors.full_messages).to include "Detail category can't be blank"
  end
   it 'detail_commodity_condition_idが空では出品できない' do
   @item.detail_commodity_condition_id = ''
   @item.valid?
    expect(@item.errors.full_messages).to include "Detail commodity condition can't be blank"
   end
   it 'delivery_burden_idが空では出品できない' do
  @item.delivery_burden_id = ''
  @item.valid?
   expect(@item.errors.full_messages).to include "Delivery burden can't be blank"
   end
   it 'region_idが空では出品できない' do
   @item.region_id = ''
   @item.valid?
  expect(@item.errors.full_messages).to include "Region can't be blank"
  end
   it 'days_to_ship_idが空では出品できない' do
   @item.days_to_ship_id = ''
  @item.valid?
   expect(@item.errors.full_messages).to include "Days to ship can't be blank"
   end
   it 'priceが空では出品できない' do
   @item.price = ''
   @item.valid?
   expect(@item.errors.full_messages).to include "Price can't be blank"
   end
   it '販売価格が￥300より少ない時は出品できない' do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
   end
   it '販売価格が￥9999999より多い時は出品できない' do
    @item.price = 10_000_000
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
   end
   it 'ユーザーが紐付いていないと出品できない' do
   @item.user = nil
   @item.valid?
   expect(@item.errors.full_messages).to include('User must exist')
   end
   it 'priceは(半角数値)でなければ出品できない' do
    @item.price= "３００" 
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not a number")
  end
  end
end
end



