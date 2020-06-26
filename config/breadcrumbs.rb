crumb :top do
  link "トップページ", root_path
end

crumb :posts do 
  link "投稿一覧", posts_path
  parent :top
end

crumb :user do |user|
  link user.username, user_path(user)
  parent :posts
end

crumb :icon_edit do |user|
  link "アイコンの変更", edit_user_path(user)
  parent :user, user
end

crumb :profile_edit do |user|
  link "プロフィール編集", edit_user_registration_path(user)
  parent :user, user
end

crumb :follow_user do |user|
  link "フォロー/フォロワー", follow_user_path(user)
  parent :user, user
end
