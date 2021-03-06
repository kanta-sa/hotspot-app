class Post < ApplicationRecord
  # モジュール
  mount_uploader :image, ImageUploader
  
  
  # 関連
  belongs_to :user
  has_many :favorites, dependent: :destroy
  
  has_many :comments, dependent: :destroy
  
  belongs_to :prefecture
  belongs_to :city
  
  has_many :notifications, dependent: :destroy
  
  has_many :reviews, dependent: :destroy
  
  ransacker :favorites_count do
    query = '(SELECT COUNT(favorites.post_id) FROM favorites WHERE favorites.post_id = posts.id GROUP BY favorites.post_id)'
    Arel.sql(query)
  end
  
  ransacker :comments_count do
    query = '(SELECT COUNT(comments.post_id) FROM comments WHERE comments.post_id = posts.id GROUP BY comments.post_id)'
    Arel.sql(query)
  end
  
  ransacker :reviews_avg do
    query = '(SELECT AVG(reviews.score) FROM reviews WHERE reviews.post_id = posts.id GROUP BY reviews.post_id)'
    Arel.sql(query)
  end
  
  
  # フック
  before_validation :join_address
  geocoded_by :address
  after_validation :geocode
  
  
  # バリデーション
  validates :name,            presence: true, 
                              length: {maximum: 20}
  validates :information,     length: {maximum: 255}
  validates :image,           presence: true
  validates :user_id,         presence: true
  validates :prefecture_id,   presence: true
  validates :city_id,         presence: true
  
  
  # メソッド
  def favorite_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def create_notification_favorite!(current_user) # いいね通知の作成メソッド
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_user.id, user_id, id, 'favorite'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        post_id: id,
        visited_id: user_id,
        action: 'favorite'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
  
  def create_notification_comment!(current_user, comment_id) # コメント通知の作成メソッド
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      post_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
  
  def avg_score # レビューの平均点を求める
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end
  
  def review_score_percentage # レビューの平均点を百分率で求める
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f*100/5
    else
      0.0
    end
  end
  
  # メソッド(Private)

  private
  
  def join_address
    return if prefecture_id.nil? || city_id.nil?
    self.address = [Prefecture.find_by(id: prefecture_id).name, City.find_by(id: city_id).name].join('')
  end
end
