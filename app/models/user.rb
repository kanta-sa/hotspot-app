class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :username, presence: true, length: { maximum: 10 }
  validates :email, presence: true
  
  mount_uploader :image, ImageUploader
  
  has_many :posts
end
