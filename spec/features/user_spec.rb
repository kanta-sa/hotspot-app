require 'rails_helper'

feature 'User', type: :feature do
  feature 'ユーザー登録前' do
    scenario 'ユーザー登録できるか' do
      visit root_path
      click_on "新規登録", match: :first
      fill_in "ユーザー名", with: "テスト"
      fill_in "メールアドレス", with: "test@example.com"
      fill_in "パスワード", with: "password"
      fill_in "パスワード確認", with: "password"
      click_on "ユーザーを作成"
      expect(page).to have_content("プロフィール編集")
    end
    
    scenario 'ログインできないか' do
      visit root_path
      click_on "ログイン", match: :first
      fill_in "メールアドレス", with: "aaa@example.com"
      fill_in "パスワード", with: "password"
      click_on "ログインする"
      expect(current_path).to eq new_user_session_path
    end
  end
end

feature 'ユーザー登録後', type: :feature do
  let(:user) { create(:user) }
  
  background do
    visit new_user_session_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_on "ログインする"
  end
  
  scenario 'ログインできているか' do
    expect(current_path).to eq user_path(user)
  end
  
  scenario 'ログアウトできるか' do
    click_on "ログアウト", match: :first
    expect(current_path).to eq root_path
  end
  
  scenario 'プロフィール編集ページのフォームは正しい値か' do
    click_on "プロフィール編集"
    expect(page).to have_field(:user_username, with: "#{user.username}")
  end
  
  scenario '実際にプロフィールを編集できるか' do
    click_on "プロフィール編集"
    fill_in :user_current_password, with: user.password
    click_on "プロフィールを変更する"
    expect(current_path).to eq user_path(user)
  end
  
  scenario 'ユーザー退会処理ができるか' do
    click_on "プロフィール編集"
    click_on "削除"
    expect(current_path).to eq root_path
  end
end

feature 'ゲストユーザーの操作', type: :feature do
  let(:guest) { create(:guest_user) }
  
  background do
    visit new_user_session_path
    fill_in "メールアドレス", with: guest.email
    fill_in "パスワード", with: guest.password
    click_on "ログインする"
  end
  
  scenario 'ログインできているか' do
    expect(page).to have_content("ゲストユーザーはプロフィールを編集できません")
  end
  
  scenario "プローフィールのURLに直接アクセスしたらリダイレクトされる" do
    visit edit_user_registration_path
    expect(current_path).to eq user_path(guest)
  end
  
  scenario "プロフィール画像の編集ページに直接アクセスしたらリダイレクトされる" do
    visit edit_user_path(guest)
    expect(current_path).to eq user_path(guest)
  end
end