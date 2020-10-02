require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:user) { create(:user) }
  let(:other_user) { create(:other_user) }
  let(:active) { user.relationships.build(follow_id: other_user.id) }
  subject { active }
  
  it "リレーションシップが有効であるかどうか" do
    is_expected.to be_valid
  end
  
  it "フォローしている人が正しいかどうか" do
    expect(active.user).to eq user 
  end
  
  it "フォローされている人が正しいかどうか" do
    expect(active.follow).to eq other_user
  end
  
  describe 'バリデーション' do
    it 'user_idが存在しないといけない' do
      active.user_id = nil
      is_expected.not_to be_valid
    end
    
    it 'follow_idが存在しないといけない' do
      active.follow_id = nil
      is_expected.not_to be_valid
    end
  end
end