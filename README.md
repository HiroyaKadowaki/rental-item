# アプリケーション名

貸し出し管理アプリ

# アプリケーション概要

備品の登録、貸し出し管理ができるアプリです。
貸し出しがされている場合、誰が借りているのかを確認することもできます。

# URL



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

・　ユーザー登録機能
・　ユーザーログイン機能
・　カテゴリー登録機能
・　備品登録機能
・　備品管理機能
・　備品詳細ページ
・　CSS
・　マイページ確認機能
・　貸し出し機能
・　貸し出し履歴機能
・　マイページ編集機能
・　マイページからの返却機能
・　備品予約機能
・　エラー文を日本語化

# 実装した機能についてのGIFと解説

未ログイン時の画面とログインと新規登録画面
https://gyazo.com/e8038c301c009f16fad46baab20b52b9

ログイン機能とログイン時の画面
https://gyazo.com/39774ca1f8cb98d1940e215efd1028c5

 備品の追加と追加された状態
 https://gyazo.com/2e527a9d0bb559ce90fb07d10b2bc4dd

 貸し出し可と返却の切り替え
 https://gyazo.com/c5ec3bdc919db576c2f2803cc8c80955

マイページから借りているものの確認、返却可能
https://gyazo.com/0846f1c4279d85b4ee424c532ce05cf1

貸し出し状況によって貸し出し状況の変化
https://gyazo.com/53a9e3b754a1ebe6dc55988f67674568

貸し出されていない備品は詳細ページからも貸し出し可能
https://gyazo.com/b6f3ea31247d48d2059762c56076f953



# 実装予定の機能

・　備品予約機能
・　エラー文を日本語化
・　貸し出し履歴機能

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
