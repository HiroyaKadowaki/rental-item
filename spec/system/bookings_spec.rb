require 'rails_helper'

RSpec.describe "Items", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @category = FactoryBot.create(:category)
    @item = FactoryBot.create(:item)
    @rental = FactoryBot.create(:rental)
    @booking = FactoryBot.create(:booking)

  end

  context 'カテゴリーが登録できるとき' do
    it 'ログインしたユーザーは備品の予約ができる' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'メール', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      expect(page).to have_content("カテゴリー追加")
      visit new_category_path
      fill_in "（必須）", with: @category
      expect{
        find('input[name="commit"]').click
      }.to change { Category.count }.by(1)
      expect(current_path).to eq(root_path)
      expect(page).to have_content(@category.name)
      visit new_item_path
      fill_in 'item_number', with: @item.number
      fill_in 'item_name', with: @item.name
      expect{
        find('#item_category_id').click
      }.to change { Item.count }.by(0)
      expect{
        find('#item_category_id').find("option[value= '#{@item.category_id}' ]").click
      }.to change { Item.count }.by(0)
      expect{
        find('input[name="commit"]').click
      }.to change { Item.count }.by(1)
      expect(current_path).to eq(category_path(@item.category.id))
      expect(page).to have_content(@item.number)
      expect(page).to have_content(@item.name)
      expect(page).to have_content("貸し出し可")
      visit new_booking_path
      fill_in "booking_date", with:@booking.date
      expect{
        find('#booking_item_id').click
      }.to change { Item.count }.by(0)
      expect{
        find('#booking_item_id').find("option[value= '#{@rental.item.id}' ]").click
      }.to change { Item.count }.by(0)
      expect{
        find('input[name="commit"]').click
      }.to change { Booking.count }.by(1)
      expect(current_path).to eq(root_path)
      visit category_path(@rental.item.category.id)
      expect(page).to have_content("予約中")
      visit user_path(@user.id)
      expect(page).to have_content("キャンセル")
    end
  end

  context "備品の登録ができないとき" do
    it "ログインしていないと備品の予約ができない" do
      visit root_path
      expect(page).to have_no_content("カテゴリー追加")
    end
  end
end
