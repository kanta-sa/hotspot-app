require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:testuser) }
  let(:prefecture) { create(:prefecture) }
  let(:city) { create(:city, prefecture_id: prefecture.id) }
  let(:post) { create(:post, user_id: user.id, prefecture_id: prefecture.id, city_id: city.id) }
  subject { post }
  
  describe 'バリデーション' do
    it '必須カラムが設定されているか' do
      is_expected.to be_valid
    end
    
    it 'nameカラムが空の時はNG' do
      post.name = ''
      is_expected.not_to be_valid
    end
    
    it 'nameカラムが長すぎるとNG' do
      post.name = 'a' * 21
      is_expected.not_to be_valid
    end
    
    it 'imageカラムが空の時はNG' do
      post.image = nil
      is_expected.not_to be_valid
    end
    
    it 'informationカラムが長すぎるとNG' do
      post.information = 'a' * 256
      is_expected.not_to be_valid
    end
    
    it 'user_idカラムが空の時はNG' do
      post.user_id = nil
      is_expected.not_to be_valid
    end
    
    it 'prefecture_idカラムが空の時はNG' do
      post.prefecture_id = nil
      is_expected.not_to be_valid
    end
    
    it 'city_idカラムが空の時はNG' do
      post.city_id = nil
      is_expected.not_to be_valid
    end
  end
end