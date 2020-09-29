class Prefecture < ApplicationRecord
  # 関連
  has_many :cities
  has_many :posts
end
