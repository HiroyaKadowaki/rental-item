require 'rails_helper'

RSpec.describe Category, type: :model do
  describe '#create' do
    before do
      @category = FactoryBot.build(:category)
    end

    context 'データが保存できる時' do
      it "全てのカラム名が存在すれば登録できること" do
        expect(@category).to be_valid
      end
    end

    context 'データが保存できない時' do
      it "nameが空では保存できないこと" do
        @category.name = ""
        @category.valid?
        expect(@category.errors.full_messages).to include "名前を入力してください"
      end
    end
  end
end
