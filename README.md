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
| birthdate         | date   | null: false |


### Association

- has_many :orders
- has_many :messages

## items テーブル

| Column                  | Type    | Options     |
| ----------------------- | ------- | ----------- |
| image                   | text    | null: false |
| name                    | text    | null: false |
| description             | text    | null: false |
| category                | integer | null: false |
| status                  | integer | null: false |
| delivery_change_burden  | integer | null: false |
| prefecture              | integer | null: false |
| days_up_to_delivery     | integer | null: false |
| price                   | integer | null: false |


- has_many :messages
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :delivery_change_burden
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :days_up_to_delivery

## messages テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| coment        | text       | null: false                    |
| checked       | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

- be_longs_to :item
- be_longs_to :user


## address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| block          | string     | null: false                    |
| building_name  | string     |                     |
| phone_number   | string     | null: false                    |


- belongs_to :order
- belongs_to_active_hash :prefecture


## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| items   | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

belongs_to :item
belongs_to :user
belongs_to :address