# The HotSpot DB
就職活動用のポートフォリオとして開発した個人アプリです。SNS感覚で誰でも気軽に全国の観光地を共有できるアプリになっています。

# 制作背景
有名な観光地だけではなく、多くの人にはまだ知られていないが魅力の詰まった観光地を共有したいと思ったことがきっかけです。

というのも、友人と旅行した際に、その場の思いつきで行った場所が想像以上に良い場所であったりと、有名な観光地だけが魅力的な訳ではないということを実感しました。観光客として行った私が見つけられる数には限りがあり、地元の人だけが知る魅力的な場所があるはずと考えました。

そこで、SNSのような気軽さを取り入れて、誰でも気軽に自分の知る魅力的な場所、観光地を共有できるアプリがあれば良いなと思い、このアプリを作成しようと思いました。有名な観光地だけでなく、穴場スポットを新たに発見できるようなアプリにしたいと思いました。


# URL 
https://www.hotspotdb.work
* ログインページから【ゲストユーザー】として簡単ログインできます。

# 使用技術
* Ruby 2.5.8, Rails 5.2.4
* Sass, jQuery
* AWS (EC2, RDS for MySQL 5.7.26, S3, VPC, Route53, ALB, ACM)
* Docker
* CircleCI CI/CD
* Capistrano
* RSpec

# AWS構成図
![aws](https://user-images.githubusercontent.com/61926786/101277386-8273a980-37f7-11eb-8d46-5ef872f24d02.png)

# 機能一覧
* ユーザー登録
  * deviseを使用
  * 新規登録、ログイン、ログアウト機能
  * マイページ、登録情報編集機能
* 投稿機能
  * 投稿一覧、投稿詳細表示、新規投稿、投稿削除
  * 画像のアップロードはCarrierWaveを使用
  * Googlemap表示(Maps JavaScript API)
  * 住所から緯度経度変換(Geocoding API)
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
* レビュー機能
* 検索機能
  * Ransackを使用
* Rspecによるテスト機能
* 通知機能
* SNS機能・ログイン機能(Google/Facebook/Twitter)
* パンくず機能
* その他
  * SelecyBoxの中身を動的に変更する機能
    * 都道府県SelectBoxに対する市区町村SelectBoxをAjaxで動的に制御

# ER図
![ERD](https://user-images.githubusercontent.com/61926786/101979484-cc014000-3ca0-11eb-95cf-6e463f19b143.png)
