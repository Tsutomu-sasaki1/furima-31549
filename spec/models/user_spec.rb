require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'mailは、@を含まないと登録できない' do
        @user.email = 'testexample'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'emailが一意性でなければ登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordは、6文字以上の入力でなければ登録できない' do
        @user.password = 'aa000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは、半角英数字混合でなければ登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは、確認用を含めて2回入力しなければ登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'pssswordとencrypted_password（確認用）、値が一致しなければ登録出来ない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザー本名は、名字と名前がそれぞれ空では登録できない' do
        @user.name_first = ''
        @user.name_second = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Name first is invalid', 'Name second is invalid')
      end
      it 'ユーザー本名(name_first)は、全角（漢字・ひらがな・カタカナ）での入力でないと登録できない' do
        @user.name_first = 'www111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name first is invalid')
      end
      it 'ユーザー本名(name_second)は、全角（漢字・ひらがな・カタカナ）での入力でないと登録できない' do
        @user.name_second = '111www'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name second is invalid')
      end
      it 'ユーザー本名のフリガナは、名字と名前が空では登録できない' do
        @user.name_kana_first = ''
        @user.name_kana_second = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana first is invalid', 'Name kana second is invalid')
      end
      it 'ユーザー本名のフリガナ(name_kana_first)は、全角（カタカナ）での入力でないと登録できない' do
        @user.name_kana_first = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana first is invalid')
      end
      it 'ユーザー本名のフリガナ(name_kana_second)は、全角（カタカナ）での入力でないと登録できない' do
        @user.name_kana_second = 'かかかかかか'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana second is invalid')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
    context '新規登録がうまくいくとき' do
      it 'ニックネーム、メールアドレス、パスワード,パスワード(確認)、名前(全角)、カナ(全角)、生年月日、を入力すれば登録可能' do
        expect(@user).to be_valid
      end
    end
  end
end
