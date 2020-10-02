class Relationship < ApplicationRecord
  # 関連
  belongs_to :user
  belongs_to :follow, class_name: 'User'
  
  
  # バリデーション
  validates :user_id,     presence: true
  validates :follow_id,   presence: true
end
