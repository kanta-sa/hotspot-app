class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  validates :name, presence: true, length: {maximum: 20}
  validates :information, presence: true, length: {maximum: 255}
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  
  #都道府県用
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  def favorite_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
