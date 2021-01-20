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
    end
  end
end
