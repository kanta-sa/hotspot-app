class City < ApplicationRecord
  # 関連
  belongs_to :prefecture
  has_many :posts
end
