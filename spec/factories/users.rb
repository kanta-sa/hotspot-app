FactoryBot.define do
  factory :testuser, class: User do
    username { 'testuser' }
    email { 'testuser@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end