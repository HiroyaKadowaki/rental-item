require 'rails_helper'

RSpec.describe "新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context '新規ユーザー登録ができるとき' do
    it '正しい情報を入力すると新規ユーザーが登録され、トップページに移動する' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      expect(page).to have_content('新規登録')
      visit new_user_registration_path
      fill_in '名前（必須）', with: @user.name
      fill_in '部署名（必須）', with: @user.department
      fill_in 'メール', with: @user.email
      fill_in 'パスワード', with: @user.password
      fill_in 'Password confirmation', with: @user.password_confirmation
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      expect(current_path).to eq(root_path)
      expect(page).to have_content('備品の予約')
      expect(page).to have_content('備品の追加')
      expect(page).to have_content( @user.name )
      expect(page).to have_content('ログアウト')
      expect(page).to have_no_content('ログイン')
    end
  end

  context '新規ユーザー登録ができないとき' do
    it '誤った情報を入力すると新規ユーザーが登録されず、新規登録ページに戻る' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      expect(page).to have_content('新規登録')
      visit new_user_registration_path
      fill_in '名前（必須）', with: ''
      fill_in '部署名（必須）', with: ''
      fill_in 'メール', with: ''
      fill_in 'パスワード', with: ''
      fill_in 'Password confirmation', with: ''
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      expect(current_path).to eq('/users')
    end
  end

end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができ、プロフィールにも情報が表示される' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'メール', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      expect(page).to have_content('備品の予約')
      expect(page).to have_content('備品の追加')
      expect(page).to have_content( @user.name )
      expect(page).to have_content('ログアウト')
      expect(page).to have_no_content('ログイン')
      visit user_path(@user.id)
      expect(page).to have_content( @user.name )
      expect(page).to have_content( @user.department )
    end
  end

  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'メール', with: ''
      fill_in 'パスワード', with: ''
      find('input[name="commit"]').click
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
