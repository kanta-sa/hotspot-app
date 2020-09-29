class Favorite < ApplicationRecord
  # 関連
  belongs_to :user
  belongs_to :post
  
  
  # バリデーション
  validates :user_id, uniqueness: {scope: :post_id}
end
