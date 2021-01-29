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

貸し出し画面変更確認用アカウント
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


![ダウンロード (6)](https://user-images.githubusercontent.com/71200627/105972575-1878d180-60cf-11eb-9483-3391433d4ad5.gif)


ログイン機能とログイン時の画面


![ダウンロード (9)](https://user-images.githubusercontent.com/71200627/105973369-00ee1880-60d0-11eb-8d0b-d6bebc0fe43a.gif)

カテゴリーの追加と追加された状態


![ダウンロード (3)](https://user-images.githubusercontent.com/71200627/105971803-46a9e180-60ce-11eb-9317-ced5de9c7b5d.gif)

カテゴリーの備品データありなしのビューの違い


![ダウンロード](https://user-images.githubusercontent.com/71200627/105973782-7e198d80-60d0-11eb-9cd0-ed170692ca6e.gif)


備品の追加と追加された状態


![ダウンロード (1)](https://user-images.githubusercontent.com/71200627/105971342-c1263180-60cd-11eb-9db5-93be1790f30d.gif)


貸し出し可と返却の切り替え


![ダウンロード (7)](https://user-images.githubusercontent.com/71200627/105972881-70afd380-60cf-11eb-8259-baf73db582ac.gif)


マイページから借りているものの確認、返却可能


![プロフィールからも削除](https://user-images.githubusercontent.com/71200627/105972426-f41cf500-60ce-11eb-8117-3fe0583c1d6e.gif)

他人の貸し出し状況によって貸し出し状況の変化


![ダウンロード (4)](https://user-images.githubusercontent.com/71200627/105972066-9688a880-60ce-11eb-980d-77611d89e8fd.gif)


貸し出されていない備品は詳細ページからも返却可能


![ダウンロード (8)](https://user-images.githubusercontent.com/71200627/105973103-ae146100-60cf-11eb-82fe-586305acf278.gif)



備品の削除


![ダウンロード (2)](https://user-images.githubusercontent.com/71200627/105971636-16624300-60ce-11eb-99d2-9a592a50999f.gif)


# 実装予定の機能

・備品予約機能
・エラー文を日本語化
・貸し出し履歴機能
・AWSでのデプロイ

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
