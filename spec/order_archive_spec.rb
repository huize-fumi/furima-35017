require 'rails_helper'

RSpec.describe OrderArchive, type: :model do
  before '商品購入' do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user, email: 'test2@example')
    @order_archive = FactoryBot.build(:order_archive, item_id: @item.id, user_id: @user.id)
    sleep(1)
  end

  context '購入ができる時' do
    it 'すべての情報が正しく入力されていれば購入できること' do
      expect(@order_archive).to be_valid
    end

    it '建物名がなくても購入できること' do
      @order_archive.building = ''
      expect(@order_archive).to be_valid
    end
  end

  context '購入ができない時' do
    it '発送元の地域の情報がなければ購入できないこと' do
      @order_archive.shipment_source_id = ''
      @order_archive.valid?
      expect(@order_archive.errors.full_messages).to include("Shipment source can't be blank")
    end

    it '郵便番号の情報がなければ購入できないこと' do
      @order_archive.postal = ''
      @order_archive.valid?
      expect(@order_archive.errors.full_messages).to include("Postal can't be blank")
    end

    it '市区町村の情報がなければ購入できないこと' do
      @order_archive.city = ''
      @order_archive.valid?
      expect(@order_archive.errors.full_messages).to include("City can't be blank")
    end

    it '番地の情報がなければ購入できないこと' do
      @order_archive.address = ''
      @order_archive.valid?
      expect(@order_archive.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号の情報がなければ購入できないこと' do
      @order_archive.phone_number = ''
      @order_archive.valid?
      expect(@order_archive.errors.full_messages).to include("Phone number can't be blank")
    end

    it '郵便番号にハイフンがないと購入できないこと' do
      @order_archive.postal = '1234567'
      @order_archive.valid?
      expect(@order_archive.errors.full_messages).to include('Postal is invalid')
    end

    it '電話番号が英数字混合では購入できないこと' do
      @order_archive.phone_number = '12345abcdef'
      @order_archive.valid?
      expect(@order_archive.errors.full_messages).to include('Phone number is invalid')
    end

    it '都道府県で-が選択されている場合出品できないこと' do
      @item.shipment_source_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment source can't be blank")
    end

    it '電話番号は11桁を超えると購入できないこと' do
      @order_archive.phone_number = '1234567890123'
      @order_archive.valid?
      expect(@order_archive.errors.full_messages).to include('Phone number is invalid')
    end

    it '電話番号に数値以外があると購入できないこと' do
      @order_archive.phone_number = '090-1234-5678'
      @order_archive.valid?
      expect(@order_archive.errors.full_messages).to include('Phone number is invalid')
    end

    it '紐づくユーザーがいないと購入できないこと' do
      @order_archive.user_id = nil
      @order_archive.valid?
      expect(@order_archive.errors.full_messages).to include("User can't be blank")
    end

    it '紐づくアイテムがないと購入できないこと' do
      @order_archive.item_id = nil
      @order_archive.valid?
      expect(@order_archive.errors.full_messages).to include("Item can't be blank")
    end

    it 'tokenが空では登録できないこと' do
      @order_archive.token = nil
      @order_archive.valid?
      expect(@order_archive.errors.full_messages).to include("Token can't be blank")
    end
  end
end
