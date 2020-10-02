require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = create(:testuser)
    @prefecture = create(:prefecture)
    @city = create(:city, prefecture_id: @prefecture.id)
    @post = create(:post, user_id: @user.id, prefecture_id: @prefecture.id, city_id: @city.id)
  end
  
  describe 'バリデーション' do
    it 'postモデルの必要なカラムが設定されていれば、OK' do
      expect(@post).to be_valid
    end
    
    it 'nameが空だとNG' do 
      @post.name = ''
      expect(@post).not_to be_valid
    end
    
    it 'nameが長すぎるとNG' do
      @post.name = 'a' * 21
      expect(@post).not_to be_valid
    end
    
    it 'imageが空だとNG' do
      @post.image = ''
      expect(@post).not_to be_valid
    end
    
    it 'informationが長すぎるとNG' do
      @post.information = 'a' * 256
      expect(@post).not_to be_valid
    end
  end
end