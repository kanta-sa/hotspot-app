class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  validates :name, presence: true, length: {maximum: 20}
  validates :information, length: {maximum: 255}
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  belongs_to :prefecture
  belongs_to :city
  
  def favorite_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  
end
