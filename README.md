# README

# テーブル設計

## user テーブル

| Column            | Type   | Options                   |
| ----------------- | ------ | ------------------------- |
| email             | string | null: false               |
| password          | string | null: false               |
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
- has_one : address

## sell-item テーブル

| Column           | Type          | Options                        |
| ---------------- | ------------- | ------------------------------ |
| item-name        | string        | null: false                    |
| category         | string        | null: false                    |
| condition        | string        | null: false                    |
| image            | ActiveStorage | null: false                    |
| shipping-area    | string        | null: false                    |
| date-of-shipment | string        | null: false                    |
| price            | string        | null: false                    |
| shipping-charges | string        | null: false                    |
| explanation      | string        | null: false                    |
| user             | references    | null: false, foreign_key: true |

### Association

- has_many : histories
- belongs_to : user
- has_many : comments

## addresses テーブル

| Column           | Type          | Options                        |
| ---------------- | ------------- | ------------------------------ |
| postal-code      | string        | null: false                    |
| prefectures      | string        | null: false                    |
| city             | string        | null: false                    |
| address          | string        | null: false                    |
| building         | string        | null: false                    |
| phone-number     | string        | null: false                    |
| user             | references    | null: false, foreign_key: true |

### Association

- belongs_to : user

## histories　(中間)テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| sell-item | references | null: false, foreign_key: true |

### Association

- belongs_to : sell-item
- belongs_to : user

## comments テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| text           | string     | null: false                    |
| user           | references | null: false, foreign_key: true |
| sell-item      | references | null: false, foreign_key: true |

### Association

- belongs_to : sell-item
- belongs_to : user
