# Trip Log

## 概要(このアプリでできること)
- ユーザー登録、ログイン
- 記事の投稿（写真1枚付き）
- コメント機能
- タイトル検索機能

## 本番環境
- URL: https://trip-log2.herokuapp.com/ 
- テスト用アカウント
  - メールアドレス: test@gmail.com
  - パスワード: 12345678

## 制作背景
人々を楽しませて、そして幸せにできるサービスを生み出すこと。をテーマに掲げて、人生を楽しむ為の一つのツールを制作したいと考えました。
キーワードは、「3つの繋ぐ。」
「人と人を繋ぐ、人とモノを繋ぐ、人と場所を繋ぐ」
一人一人の楽しむ＆幸せになることを定義して、「3つの繋ぐ」をキッカケに人生の分岐点となるような出会い・体験・経験を提供することが着地点です。

「Trip Log = トリップログ」は、人生の軌跡を残しながら、自身の成長と新しいことへ"キッカケ"になるようなツールを目指します。

現段階では、基本的なブログ投稿機能実装のみです。Trip Logの理想は、ブログで伝える、コミュニティで交流する、フリマで旅のグッズを手に入れる機能を付けることです。
さらに自身の経験をサイトを通して伝える為、Trip Logは伝える力とブランディングとマーケティング力を付けられるチューター制度で個々の成長を促すサービスともなります。

Trip Logは、個々の成長と周囲との繋がりから、クライアントと一緒に成長していきます。

## DEMO
- 会員登録/ログイン
  - TripLogの簡易的なランディングページになっています。登録後、トップページへ遷移します。


[![](https://i.gyazo.com/18f0e3f5be7dd24c6c116a76b8170ce9.gif)](https://gyazo.com/18f0e3f5be7dd24c6c116a76b8170ce9)
  
- トップページ
  - 新着投稿が掲載されます。


[![Image from Gyazo](https://i.gyazo.com/db24319ef4c8496cba1c5acedbe54f29.gif)](https://gyazo.com/db24319ef4c8496cba1c5acedbe54f29)

## 工夫したポイント
- 会員登録/ログイン前に、サービスの詳細を記載しています。
登録後にサービスを利用できるようにValidationをかけています。
- トップページでは、目立つようにスライドショーでの特集を掲載できるようになっています。
- トップページで投稿一覧（5枚）が表示されるようになっています。
- 右上のプルダウンボタンでページ遷移が簡単にできるようにしています。

## 使用技術
- ruby
- Java Script
- Jquery
- haml,sass記法

## 開発環境
- Rubyバージョン 2.6.5
- Ruby/Ruby on Rails/PostgreSQL/Github/Heroku/Visual Studio Code

## 開発期間と平均作業時間
- 開発期間：17日間（7/9~7/20 (11), 8/11-8/16(6)）
- 1日あたりの平均作業時間：10

## 課題や今後実装したい機能
### 課題
- 検索機能がタイトルのみでの検索となっています。
- いいね機能が非同期通信できていないです。
- レスポンシブデザインに対応できていないです。
- 投稿や詳細画面が簡易的なビューになっています。

### 実装したい機能
- EC機能（フリマ用）
- グループ機能（コミュニティ用）
- チャット機能（コミュニティ用）
- 写真複数枚投稿

# DB設計
<img src="https://github.com/HosoRo/trip-log2/blob/master/app/assets/images/Trip_Log_DB.png?raw=true">

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|encrypeted_password|string|null: false|
|reset_password_token|string|
|reset_password_sent_at|datetime|
|remember_created_at|datetime|

### Association
- has_many :articles
- has_many :comments
- has_many :likes, dependent: :destroy

--------------------------------------------------------------

## articlesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|description|text|null: false|
|image|string|

### Association
- belongs_to :user
- has_many :comments
- has_many :likes, dependent: :destroy

--------------------------------------------------------------

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|article_id|integer|
|description|text|null: false|

### Association
- belongs_to :article
- belongs_to :user

--------------------------------------------------------------


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|article|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :article, counter_cache: :likes_count
