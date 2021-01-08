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
    end

    context 'データが保存できない時' do
      it "nameが入力されていない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "name can't be blank" &&"Name is invalid"
      end
    end
  end

end
