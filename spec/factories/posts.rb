FactoryBot.define do
  factory :post do
    name { "富士山" }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.png')) }
    user_id {  }
    prefecture_id {  }
    city_id {  }
  end
end