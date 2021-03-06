# README

# テーブル設計

## users テーブル

| Column            | Type   | Options                   |
| ----------------- | ------ | ------------------------- |
| email             | string | null: false, unique: true |
| encrypted_password| string | null: false               |
| nickname          | string | null: false               |
| name_first        | string | null: false               |
| name_second       | string | null: false               |
| name_kana_first   | string | null: false               |
| name_kana_second  | string | null: false               |
| birthday          | date   | null: false               |

### Association

- has_many : histories
- has_many : items

## items テーブル

| Column              | Type          | Options                       |
| ----------------    | ------------- | ------------------------------|
| item_name           | string        | null: false                   |
| category_id         | integer       | null: false                   |
| condition_id        | integer       | null: false                   |
| prefectures_id      | integer       | null: false                   |
| date_of_shipment_id | integer       | null: false                   |
| price               | integer       | null: false                   |
| shipping_charge_id  | integer       | null: false                   |
| explanation         | text          | null: false                   |
| user                | references    | null: false, foreign_key: true|

### Association

- has_one : history
- belongs_to : user

## addresses 住所（発送先）テーブル

| Column           | Type          | Options                        |
| ---------------- | ------------- | ------------------------------ |
| postal_code      | string        | null: false                    |
| city             | string        | null: false                    |
| address          | string        | null: false                    |
| phone_number     | string        | null: false                    |
| building         | string        |                                |
| prefectures_id   | integer       | null: false                    |
| history          | references    | null: false, foreign_key: true |

### Association

belongs_to : history

## historie  購入管理(中間)テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to : item
- belongs_to : user
- has_one : address