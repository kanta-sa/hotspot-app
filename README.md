# The HotSpot DB
全国の観光地を共有できるアプリです。

# 制作背景
旅行先で、観光する場所を選ぶ際にSNSを使い調べる機会が増えてきてると思います。そこで、観光地を調べるのに特化したアプリが有ったらいいなと思い、制作しました。

# URL 
https://hotspotdb.herokuapp.com/
* ログインページから【ゲストユーザー】として簡単ログインできます。

# 使用技術
* Ruby 2.5.8, Rails 5.2.4
* MySQL 5.5.62
* Puma
* Sass, jQuery
* Amazon S3

# 機能一覧
* ユーザー登録
  * deviseを使用
  * 新規登録、ログイン、ログアウト機能
  * マイページ、登録情報編集機能
* 投稿機能
  * 投稿一覧、投稿詳細表示、新規投稿、投稿削除
  * 画像のアップロードはCarrierWaveを使用
* コメント関係
  * コメント表示、コメント投稿、コメント削除機能
* ページネーション機能
  * (kaminari + Infinite Scroll)を使用
* いいね機能
  * 投稿したいいねの一覧表示
  * Ajaxを使用
* フォロー機能
  * フォロー、フォロワー一覧表示機能
  * Ajaxを使用
* 検索機能
  * Ransackを使用
* パンくず機能
* その他
  * SelecyBoxの中身を動的に変更する機能
    * 都道府県SelectBoxに対する市区町村SelectBoxをAjaxで動的に制御

# ER図
![ERD](https://user-images.githubusercontent.com/61926786/86127668-40915980-bb1b-11ea-84df-8053a39aa15e.png)
