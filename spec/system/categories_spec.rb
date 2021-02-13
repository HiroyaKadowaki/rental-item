require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @category = FactoryBot.create(:category)
  end

  context 'カテゴリーが登録できるとき' do
    it 'ログインしたユーザーはカテゴリーの登録ができる' do
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
    end
  end

  context "カテゴリーの登録ができないとき" do
    it "ログインしていないとカテゴリーの登録ができない" do
      visit root_path
      expect(page).to have_no_content("カテゴリー追加")
    end
  end

end
