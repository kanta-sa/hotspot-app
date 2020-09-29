class Relationship < ApplicationRecord
  # 関連
  belongs_to :user
  belongs_to :follow, class_name: 'User'
end
