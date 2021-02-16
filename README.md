# アプリケーション名

貸し出し管理アプリ

# アプリケーション概要

備品の登録、貸し出し管理ができるアプリです。
貸し出しがされている場合、誰が借りているのかを確認することもできます。

# URL

・heroku
https://rental-item.herokuapp.com

・AWS
http://18.180.185.54/

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


![ダウンロード (6)](https://user-images.githubusercontent.com/71200627/108024724-719daa80-7068-11eb-931c-a60aa2317b64.mp4)


ログイン機能とログイン時の画面


![ダウンロード (9)](https://user-images.githubusercontent.com/71200627/108024810-a1e54900-7068-11eb-8db8-e583f5e2aac1.mp4)

カテゴリーの追加と追加された状態


![ダウンロード (3)](https://user-images.githubusercontent.com/71200627/108024871-bfb2ae00-7068-11eb-8d3e-8430a20f94eb.mp4)

カテゴリーの備品データありなしのビューの違い


![ダウンロード](https://user-images.githubusercontent.com/71200627/108024905-d35e1480-7068-11eb-9e87-61a4b94657a5.mp4)


備品の追加と追加された状態


![ダウンロード (1)](https://user-images.githubusercontent.com/71200627/108024947-e375f400-7068-11eb-85ea-970b47477ebb.mp4)

説明文を選択すると、本アプリの説明が出てくる

![ダウンロード (1)](https://user-images.githubusercontent.com/71200627/108024998-043e4980-7069-11eb-941c-020a8337385c.mp4)



貸し出し可と返却の切り替え


![ダウンロード (7)](https://user-images.githubusercontent.com/71200627/108025131-436c9a80-7069-11eb-9ae5-216edecabe89.mp4)


マイページから借りているものの確認、返却可能


![プロフィールからも削除](https://user-images.githubusercontent.com/71200627/108025162-541d1080-7069-11eb-8c05-fe2d4d4554c2.mp4)


貸し出し備品は詳細ページからも返却可能


![ダウンロード (8)](https://user-images.githubusercontent.com/71200627/108025330-a0685080-7069-11eb-8b30-53ce9185f2ac.mp4)


予約を行った場合

![ダウンロード (8)](https://user-images.githubusercontent.com/71200627/108025421-ce4d9500-7069-11eb-85f1-41de3c7e9a70.mp4)


マイページより予約のキャンセルが可能

![ダウンロード (8)](https://user-images.githubusercontent.com/71200627/108025536-fb9a4300-7069-11eb-8a83-e5f547406257.mp4)


他人の貸し出し状況によって貸し出し状況の変化

![ダウンロード (4)](https://user-images.githubusercontent.com/71200627/108025246-7e6ece00-7069-11eb-8be7-1f1e65f02370.mp4)


予約中を押すと予約者のプロフィールにいく

![ダウンロード (4)](https://user-images.githubusercontent.com/71200627/108025579-11a80380-706a-11eb-82fa-b3558068ff2c.mp4)

貸し出し中を押すと貸し出されている人のプロフィールにいく

![ダウンロード (4)](https://user-images.githubusercontent.com/71200627/108025781-7c593f00-706a-11eb-9c62-1073b60d0552.mp4)


備品の削除

![ダウンロード (2)](https://user-images.githubusercontent.com/71200627/108025836-8f6c0f00-706a-11eb-8fc4-43c527defbd4.mp4)


# 実装予定の機能

・貸し出し履歴機能

# データベース設計

<img width="794" alt="b810fce9ded14dd55e3c0acab3c3f3de" src="https://user-images.githubusercontent.com/71200627/108027842-28505980-706e-11eb-85ff-1b8efab6584d.png">


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
- has_many :bookings

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
- has_many :bookings

## rentals テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## bookings テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| date       | date       | null: false                    |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
