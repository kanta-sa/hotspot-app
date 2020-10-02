FactoryBot.define do
  factory :testuser, class: User do
    username { 'testuser' }
    email { 'testuser@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
  
  factory :user, class: User do
    username { 'user1' }
    email { 'user1@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
  
  factory :other_user, class: User do
    username { 'user2' }
    email { 'user2@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end