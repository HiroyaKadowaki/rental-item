# アプリケーション名

貸し出し管理アプリ

# アプリケーション概要

備品の登録、貸し出し管理ができるアプリです。
貸し出しがされている場合、誰が借りているのかを確認することもできます。

# URL

https://rental-item.herokuapp.com

# テスト用アカウント

備品登録、貸し出しの動きの確認用アカウント
Email;111@111
password;a111111

借りている人物を確認用アカウント
Email;222@222
password;s222222

# 利用方法

このアプリの利用方法は会社で取り扱っている貸し出し可能な備品の管理のために使用できます。
会社に存在する貸し出し可能な備品を登録しておくことができます。
会社の備品を借りた際に借りたことの報告、返却時の報告を行うことができます。

# 目指した課題解決

会社で備品を管理している際に、備品がどこにあるのかがわからないという課題解決を解決したかったためです。

# 洗い出した要件

・ユーザー登録機能
・ユーザーログイン機能
・カテゴリー登録機能
・備品登録機能
・備品管理機能
・備品詳細ページ
・CSS
・マイページ確認機能
・貸し出し機能
・貸し出し履歴機能
・マイページ編集機能
・マイページからの返却機能
・備品予約機能
・エラー文を日本語化

# 実装した機能についてのGIFと解説

未ログイン時の画面とログインと新規登録画面
https://i.gyazo.com/bf63eb8d8797f54c95a720078c1aa4ca.mp4

ログイン機能とログイン時の画面
https://i.gyazo.com/fc44dcc85d29534b51a88dd537111c67.mp4

カテゴリーの追加と追加された状態
https://i.gyazo.com/70bd95c88abd217502b42bfa6f6d40cb.mp4

カテゴリーの備品データありなしのビューの違い
https://i.gyazo.com/60fa315f5d9c55261553aa929b8e9582.mp4

備品の追加と追加された状態
https://i.gyazo.com/7e51c8a39e738ce11455182600554f0b.mp4

貸し出し可と返却の切り替え
[](https://i.gyazo.com/c822126bcc3db76abc1aaf0e565a9033.mp4)

マイページから借りているものの確認、返却可能
[](https://i.gyazo.com/b5d31da085ae1f3f8f08b3ca2fbf9e98.mp4)

他人の貸し出し状況によって貸し出し状況の変化
[](https://i.gyazo.com/61956bb97432665b763cdb62436e65b4.mp4)

貸し出されていない備品は詳細ページからも貸し出し可能
[](https://i.gyazo.com/ceb641605024e5700970c4c8c9ed2753.mp4)

備品の削除
[](https://i.gyazo.com/67b6ab677b2c49fecf6bbb7b900c2782.mp4)


# 実装予定の機能

・備品予約機能
・エラー文を日本語化
・貸し出し履歴機能

# データベース設計

https://gyazo.com/1afbcb6147442b549e1faecf91f58440

# ローカルでの動作方法

git clone https://github.com/HiroyaKadowaki/rental-item

Rubyのバージョン（_6.0.0_)

# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| name       | string | null: false |
| department | string | null: false |
| email      | string | null: false |
| password   | string | null: false |

### Association

- has_many :categories
- has_many :rentals

## categories テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     | null: false                    |
| user    | references | null: false, foreign_key: true |

### Association

- has_many :items
- belongs_to :user

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| number      | string     | null: false                    |
| comment     | text       |                                |
| category    | references | null: false, foreign_key: true |

### Association

- belongs_to :category
- has_one :rental

## rentals テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
