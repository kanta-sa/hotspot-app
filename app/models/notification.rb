class Notification < ApplicationRecord
  # 関連
  belongs_to :post, optional: true
  belongs_to :comment, optional: true

  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
  
  
  # スコープ
  default_scope -> { order(created_at: :desc) }
end
