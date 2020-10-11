class Review < ApplicationRecord
  # 関連
  belongs_to :user
  belongs_to :post
  
  
  # バリデーション
  validates :score, presence: true
end
