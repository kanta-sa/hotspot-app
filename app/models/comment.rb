class Comment < ApplicationRecord
  # 関連
  belongs_to :user
  belongs_to :post
  has_many :notifications, dependent: :destroy
end
