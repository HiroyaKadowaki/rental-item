require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context 'データが保存できる時' do
      it "全てのカラム名が存在すれば登録できること" do
        expect(@item).to be_valid
      end

      it "numberが半角数字なら保存ができる" do
        @item.number = "1234"
        expect(@item).to be_valid
      end
    end

    context 'データが保存できない時' do
      it "nameが空では保存できないこと" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "名前を入力してください"
      end

      it "numberが空では保存できないこと" do
        @item.number = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "番号を入力してください"
      end

      it "numberが英角であれば保存できない" do
        @item.number = "number"
        @item.valid?
        expect(@item.errors.full_messages).to include "番号は不正な値です"
      end

      it "numberが全角であれば保存できない" do
        @item.number = "数字"
        @item.valid?
        expect(@item.errors.full_messages).to include "番号は不正な値です"
      end

      it "numberが全角数字であれば保存できない" do
        @item.number = "１２３４"
        @item.valid?
        expect(@item.errors.full_messages).to include "番号は不正な値です"
      end

      it "category_idが空であれば保存できない" do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを入力してください"
      end

    end
  end
end
