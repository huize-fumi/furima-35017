require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nickname,email,password,password_confirmation,first_name,last_name,birthdayが正しく入力されていれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = '123abc'
      @user.password_confirmation = '123abc'
      @user.valid?
    end

    it 'passwordが5文字以下であれば登録できること' do
      @user.password = '123ab'
      @user.password_confirmation = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123abc'
      @user.password_confirmation = '123abcd'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '同じemailはすでに使用されていると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it '名字(全角)が空では登録できないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it '名前(全角)が空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it '名字カナ(全角)が空では登録できないこと' do
      @user.last_name_ruby = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name ruby can't be blank")
    end

    it '名前カナ(全角)が空では登録できないこと' do
      @user.first_name_ruby = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name ruby can't be blank")
    end

    it '名字が全角であれば登録できること' do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end

    it '名前が全角であれば登録できること' do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it '名字がカナであれば登録できること' do
      @user.last_name_ruby = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name ruby is invalid')
    end

    it '名前がカナであれば登録できること' do
      @user.first_name_ruby = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name ruby is invalid')
    end

    it '誕生日が空では登録できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
