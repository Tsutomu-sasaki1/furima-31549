# README

# テーブル設計

## user テーブル

| Column            | Type   | Options                   |
| ----------------- | ------ | ------------------------- |
| email             | string | null: false, unique: true |
| encrypted_password| string | null: false               |
| nickname          | string | null: false               |
| name-first        | string | null: false               |
| name-second       | string | null: false               |
| name-kana-first   | string | null: false               |
| name-kana-second  | string | null: false               |
| birthday          | date   | null: false               |

### Association

- has_many : histories
- has_many : sell-items
- has_many : comments

## sell-item テーブル

| Column              | Type          | Options                        |
| ----------------    | ------------- | ------------------------------ |
| item-name_id        | string        | null: false                    |
| category_id         | integer       | null: false                    |
| condition_id        | integer       | null: false                    |
| shipping-area_id    | integer       | null: false                    |
| date-of-shipment_id | integer       | null: false                    |
| price_id            | integer       | null: false                    |
| shipping-charges_id | string        | null: false                    |
| explanation_id      | text          | null: false                    |
| user_id             | references    | null: false, foreign_key: true |

### Association

- has_one : histories
- belongs_to : user
- has_many : comments

## addresses テーブル

| Column           | Type          | Options                        |
| ---------------- | ------------- | ------------------------------ |
| postal-code      | string        | null: false                    |
| prefectures      | integer       | null: false                    |
| city             | string        | null: false                    |
| address          | string        | null: false                    |
| building         | string        |                                |
| phone-number     | string        | null: false                    |
| histories_id     | references    | null: false, foreign_key: true |

### Association

- belongs_to : history

## histories　(中間)テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| addresses_id | references | null: false, foreign_key: true |
| sell-item_id | references | null: false, foreign_key: true |

### Association

- belongs_to : sell-item
- has_one : addresses

## comments テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| text           | string     | null: false                    |
| user           | references | null: false, foreign_key: true |
| sell-item      | references | null: false, foreign_key: true |

### Association

- belongs_to : sell-item
- belongs_to : user
