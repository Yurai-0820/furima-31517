require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、family_name、first_name、family_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
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

      it 'emailに@が存在しないと登録できない' do
        @user.email = 'aaaaaaa111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordは半角英数混合以外では保存できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角数字と半角英字の両方を含めて設定してください')
      end

      it 'passwordが数字のみだと保存できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角数字と半角英字の両方を含めて設定してください')
      end

      it 'passwordが英字のみだと登録できない' do
        @user.password = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角数字と半角英字の両方を含めて設定してください')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '0000a'
        @user.password_confirmation = '0000a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationは同じでないといけない' do
        @user.password = '000aaa'
        @user.password_confirmation = 'aaa000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'family_nameが空だと新規登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'family_nameは全角（漢字、ひらがな、カタカナ）でないと登録できない' do
        @user.family_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid. input full-width characters')
      end
      it 'first_nameが空だと新規登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameは全角（漢字、ひらがな、カタカナ）でないと登録できない' do
        @user.first_name = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. input full-width characters')
      end

      it 'family_name_kanaが空だと新規登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'family_name_kanaは英字では登録できない' do
        @user.family_name_kana = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid. input full-width katakana characters')
      end

      it 'family_name_kanaはひらがなでは登録できない' do
        @user.family_name_kana = 'ああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid. input full-width katakana characters')
      end

      it 'first_name_kanaが空だと新規登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'first_name_kanaは英字では登録できない' do
        @user.first_name_kana = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. input full-width katakana characters')
      end

      it 'first_name_kanaはひらがなでは登録できない' do
        @user.first_name_kana = 'ああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. input full-width katakana characters')
      end

      it 'birthdayが空だと新規登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
