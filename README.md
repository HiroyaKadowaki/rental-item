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

![ログインと新規登録画面の確認](https://user-images.githubusercontent.com/71200627/108034363-c0534080-7078-11eb-96be-f4defbf5b569.gif)

ログイン機能とログイン時の画面

![ログインした場合のサイトの動き](https://user-images.githubusercontent.com/71200627/108034390-cb0dd580-7078-11eb-846f-2d8dcb6458d1.gif)

説明文を選択すると、本アプリの説明が出てくる

![説明文が出てくるのかを確認](https://user-images.githubusercontent.com/71200627/108034613-1aec9c80-7079-11eb-8c30-28d8cb425392.gif)


カテゴリーの追加と追加された状態

![カテゴリーを追加した場合](https://user-images.githubusercontent.com/71200627/108034437-dd880f00-7078-11eb-9698-c5ad15ab37d0.gif)

カテゴリーの備品データありなしのビューの違い

![備品有無での見た目の変化](https://user-images.githubusercontent.com/71200627/108034486-f1337580-7078-11eb-9a50-d5479ceb8de0.gif)


備品の追加と追加された状態

![備品の追加](https://user-images.githubusercontent.com/71200627/108034536-04464580-7079-11eb-9cb3-d1284be45b2d.gif)


貸し出し可と返却の切り替え

![貸し出しの変化](https://user-images.githubusercontent.com/71200627/108034705-3f487900-7079-11eb-922f-b8a936806e3d.gif)


マイページから借りているものの確認、返却可能

![マイページからも返却](https://user-images.githubusercontent.com/71200627/108034763-59825700-7079-11eb-8096-9dab895561c7.gif)


貸し出し備品は詳細ページからも返却可能

![プロフィールからも削除](https://user-images.githubusercontent.com/71200627/108025162-541d1080-7069-11eb-8c05-fe2d4d4554c2.mp4)

予約を行った場合

![備品を予約した場合](https://user-images.githubusercontent.com/71200627/108034897-8df61300-7079-11eb-92dc-e47433e68184.gif)


マイページより予約のキャンセルが可能

![予約者のページより予約のキャンセルが可能](https://user-images.githubusercontent.com/71200627/108034957-9fd7b600-7079-11eb-8ec9-af7d128c8f05.gif)


予約中を押すと予約者のプロフィールにいく

![予約中を押すと予約者のページに飛ぶ](https://user-images.githubusercontent.com/71200627/108035472-52a81400-707a-11eb-8f56-b9893f8c3d1a.gif)

貸し出し中を押すと貸し出されている人のプロフィールにいく

![他のユーザーが借りた場合はそのユーザーページに飛ぶ](https://user-images.githubusercontent.com/71200627/108035332-268c9300-707a-11eb-95f5-7233a97864c3.gif)


備品の削除

![備品の削除](https://user-images.githubusercontent.com/71200627/108035318-1ffe1b80-707a-11eb-8163-0b48a1a2899e.gif)


<!-- # 実装予定の機能

・貸し出し履歴機能 -->

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
