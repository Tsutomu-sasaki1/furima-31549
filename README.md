# README

# テーブル設計

## user テーブル

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
- has_many : sell_items
- has_many : comments

## sell_item テーブル

| Column              | Type          | Options                        |
| ----------------    | ------------- | ------------------------------ |
| item_name           | string        | null: false                    |
| category_id         | integer       | null: false                    |
| condition_id        | integer       | null: false                    |
| shipping_area_id    | integer       | null: false                    |
| date_of_shipment_id | integer       | null: false                    |
| price_id            | integer       | null: false                    |
| shipping_charges    | string        | null: false                    |
| explanation         | text          | null: false                    |
| user                | references    | null: false, foreign_key: true |

### Association

- has_one : histories
- belongs_to : user
- has_many : comments

## addresses テーブル

| Column           | Type          | Options                        |
| ---------------- | ------------- | ------------------------------ |
| postal_code      | string        | null: false                    |
| prefectures      | integer       | null: false                    |
| city             | string        | null: false                    |
| address          | string        | null: false                    |
| building         | string        |                                |
| phone_number     | string        | null: false                    |
| histories        | references    | null: false, foreign_key: true |

### Association

- belongs_to : history

## histories　(中間)テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| addresses    | references | null: false, foreign_key: true |
| sell_item    | references | null: false, foreign_key: true |

### Association

- belongs_to : sell_item
- has_one : addresses

## comments テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| text           | string     | null: false                    |
| user           | references | null: false, foreign_key: true |
| sell_item      | references | null: false, foreign_key: true |

### Association

- belongs_to : sell_item
- belongs_to : user
