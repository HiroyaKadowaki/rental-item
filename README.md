# アプリケーション名

# アプリケーション概要

# URL

# テスト用アカウント

# 利用方法

# 目指した課題解決

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
