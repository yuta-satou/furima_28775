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

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| prefecture   | string | null: false |
| city         | string | null: false |
| postal_code  | string | null: false |
| phone_number | string | null: false |


### Association

- has_many :items
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

- belongs_to :users
- has_many :messages
- has_many :delivery_charge_burden
- has_many :categories
- has_many :days_up_to_deliveries
- has_many :status


## messages テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| coment        | text   | null: false |
| checked       | string | null: false |
| user          | string | null: false |
| item          | string | null: false |

- be_longs_to :items
- be_longs_to :users



## category テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| category_name | string | null: false |
| item          | string | null: false |

- be_longs_to :items


## prefectures テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| prefecture_name | string | null: false |

- be_longs_to :items

## status テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| status_name     | string | null: false |

- be_longs_to :items


## prefectures テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| prefecture_name | string | null: false |

- be_longs_to :items


## days_up_to_deliveries テーブル

| Column                   | Type   | Options     |
| ------------------------ | ------ | ----------- |
| days_up_to_delivery_name | string | null: false |

- be_longs_to :items


## delivery_charge_burden テーブル

| Column                      | Type   | Options     |
| --------------------------- | ------ | ----------- |
| delivery_charge_burden_name | string | null: false |

- be_longs_to :items

