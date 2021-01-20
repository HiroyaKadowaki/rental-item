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

# 実装した機能についてのGIFと解説

# 実装予定の機能

# データベース設計

# ローカルでの動作方法

# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| name       | string | null: false |
| department | string | null: false |
| email      | string | null: false |
| password   | string | null: false |

### Association

- has_many :items
- has_many :rentals

## items テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     | null: false                    |
| number  | string     | null: false                    |
| comment | text       |                                |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :rental

## rentals テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| rental_day | date       | null: false                    |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
