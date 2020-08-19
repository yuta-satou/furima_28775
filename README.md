# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| family_name       | string | null: false |
| name              | string | null: false |
| family_name_kana  | string | null: false |
| name_kana         | string | null: false |
| birthdate         | string | null: false |


### Association

- has_many :order
- has_many :messages

## items テーブル

| Column                  | Type   | Options     |
| ----------------------- | ------ | ----------- |
| items_image             | string | null: false |
| items_name              | string | null: false |
| items_description       | string | null: false |
| category                | string | null: false |
| status                  | string | null: false |
| delivery_change_burden  | string | null: false |
| days_up_to_delivery     | string | null: false |
| price                   | string | null: false |



- has_many :messages
- has_one :order

## messages テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| coment        | text       | null: false                    |
| checked       | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

- be_longs_to :items
- be_longs_to :users


## address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | text       | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| block          | string     | null: false                    |
| building_name  | string     | null: false                    |
| phone_number   | integer    | null: false                    |
| items          | references | null: false, foreign_key: true |

- be_longs_to :items


## order テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| items   | references | null: false, foreign_key: true |

belongs_to :items
belongs_to :users