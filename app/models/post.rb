class Post < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: {maximum: 20}
  validates :information, presence: true, length: {maximum: 255}
  mount_uploader :image, ImageUploader
end
