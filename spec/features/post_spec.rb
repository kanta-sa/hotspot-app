require 'rails_helper'

feature 'Post', type: :feature do
  feature 'ログイン前' do
    scenario '新規投稿しようとしたらログイン画面に移動する' do
      visit new_post_path
      expect(current_path).to eq new_user_session_path
    end
  end
  
  feature 'ログイン後' do
    let(:user) { create(:user) } 
    let(:prefecture) { create(:prefecture) }
    let(:city) { create(:city, prefecture_id: prefecture.id) }
    
    background do
      visit new_user_session_path
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password
      click_on "ログインする"
    end
    
    scenario "新規投稿が正常に行えるか" do
      expect{
        Post.create(image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.png')),
                    name: "テスト", 
                    prefecture_id: prefecture.id, 
                    city_id: city.id, 
                    user_id: user.id)
      }.to change(Post, :count).by(1)
    end
  end 
end