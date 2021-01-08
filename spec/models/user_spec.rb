require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'データが保存できる時' do
      it "全てのカラム名が存在すれば登録できること" do
        expect(@user).to be_valid
      end

      it "passwordが６文字以上かつ英数字混合であれば登録できること" do
        @user.password = "12345a"
        @user.password_confirmation = "12345a"
        expect(@user).to be_valid
      end
    end

    context 'データが保存できない時' do
      it "nameが入力されていない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end

      it "departmentが入力されていない" do
        @user.department = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Department can't be blank"
      end

      it "emailが入力されていない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it "passwordが入力されていない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it "passwordが６文字以上であっても数字だけでは登録できないこと" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが６文字以上であっても数字だけでは登録できないこと" do
        @user.password = "asdfgh"
        @user.password_confirmation = "asdfgh"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが５文字以下であれば登録できないこと" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordとpassword_confirmationが不一致では登録できないこと" do
        @user.password = "123456"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "emailが「英数字＠英数字」だと登録ができること" do
        @user.email = "123@asd"
        expect(@user).to be_valid
      end

      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailが「英数字＠」では登録ができないこと" do
        @user.email = "111@"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "emailが「＠英数字」では登録ができないこと" do
        @user.email = "@111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
    end
  end

end
