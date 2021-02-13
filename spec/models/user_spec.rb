require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'データが保存できる時' do
      it "全てのカラム名が存在すれば保存できること" do
        expect(@user).to be_valid
      end

      it "passwordが６文字以上かつ英数字混合であれば保存できること" do
        @user.password = "12345a"
        @user.password_confirmation = "12345a"
        expect(@user).to be_valid
      end

      it "emailが「英数字＠英数字」だと保存ができること" do
        @user.email = "1234@1234"
        expect(@user).to be_valid
      end
    end

    context 'データが保存できない時' do
      it "nameが入力されていないと保存できないこと" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "名前を入力してください"
      end

      it "departmentが入力されていない保存できないこと" do
        @user.department = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "部署名を入力してください"
      end

      it "emailが入力されていないと保存できないこと" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "メールを入力してください"
      end

      it "passwordが入力されていないと保存できないこと" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end

      it "passwordが６文字以上であっても数字だけでは保存できないこと" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは不正な値です"
      end

      it "passwordが６文字以上であっても数字だけでは保存できないこと" do
        @user.password = "asdfgh"
        @user.password_confirmation = "asdfgh"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは不正な値です"
      end

      it "passwordが５文字以下であれば保存できないこと" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは不正な値です"
      end

      it "passwordとpassword_confirmationが不一致では保存できないこと" do
        @user.password = "123456"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは不正な値です"
      end

      it "重複したemailが存在する場合保存できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include "メールはすでに存在します"
      end

      it "emailが「英数字＠」では保存ができないこと" do
        @user.email = "111@"
        @user.valid?
        expect(@user.errors.full_messages).to include "メールは不正な値です"
      end

      it "emailが「＠英数字」では保存ができないこと" do
        @user.email = "@111"
        @user.valid?
        expect(@user.errors.full_messages).to include "メールは不正な値です"
      end
    end
  end

end
