require 'rails_helper'

RSpec.describe Rental, type: :model do
  describe '#create' do
    before do
      @rental = FactoryBot.build(:rental)
    end

    context 'データが保存できる時' do
      it "全てのカラム名が存在すれば登録できること" do
        expect(@rental).to be_valid
      end
    end

    context 'データが保存できない時' do
      it "rental_daymが入力されてなければ保存できないこと" do
        @rental.rental_day = ""
        @rental.valid?
        expect(@rental.errors.full_messages).to include "Rental day can't be blank"
      end
    end
  end
end
