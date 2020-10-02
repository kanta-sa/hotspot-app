require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:testuser)
    @invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
  end
  
  describe 'バリデーション' do
    it 'usernameとemailとパスワードの値が設定されていれば、OK' do
      expect(@user).to be_valid
    end
    
    it 'usernameが空だとNG' do
      @user.username = ''
      expect(@user.valid?).to eq(false)
    end
    
    it 'emailが空だとNG' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end
    
    it 'usernameは長すぎるとNG' do
      @user.username = "a" * 11
      expect(@user).not_to be_valid
    end
    
    it 'emailは長すぎるとNG' do
      @user.email = "a" * 244 + "@example.com"
      expect(@user).not_to be_valid
    end
    
    it '不当なメールアドレスを設定されるとNG' do
      @invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
    
    it 'メールアドレスに一意性がないとNG' do
      create(:testuser)
      expect(@user).not_to be_valid
    end
    
    it 'メールアドレスは小文字で登録されていないといけない' do
      mixed_case_email = "Foo@ExAMPle.CoM"
      user = create(:testuser, email: mixed_case_email)
      expect(user.email).to eq(mixed_case_email.downcase)
    end
    
    it 'パスワードが空の時はNG' do
      @user.password = @user.password_confirmation = ""
      expect(@user).not_to be_valid
    end
  end
end