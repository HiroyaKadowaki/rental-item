require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe '#create' do
    before do
      @booking = FactoryBot.build(:booking)
    end

    context 'データが保存できる時' do
      it "全てのカラム名が存在すれば登録できること" do
        expect(@booking).to be_valid
      end
    end

    context 'データが保存できない時' do
      it "dateが空では保存できないこと" do
        @booking.date = nil
        @booking.valid?
        expect(@booking.errors.full_messages).to include "予約日を入力してください"
      end

      it "itemが空では保存できないこと" do
        @booking.item = nil
        @booking.valid?
        expect(@booking.errors.full_messages).to include "備品を入力してください"
      end
    end
  end
end
