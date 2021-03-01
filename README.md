# FurimaのER図

## users テーブル

| Column             | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| nickname           | string   | null: false              |
| email              | string   | null: false unique: true |
| encrypted_password | string   | null: false              |
| family_name        | string   | null: false              |
| first_name         | string   | null: false              |
| family_name_kana   | string   | null: false              |
| first_name_kana    | string   | null: false              |
| birthday           | date     | null: false              |

### Association

- has_many :items
- has_many :comments
- has_many :orders


## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| description          | text       | null: false                    |
| category_id          | integer    | null: false                    |
| condition_id         | integer    | null: false                    |
| shipping_charge_id   | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| days_to_ship_id      | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | foreign_key: true              |

### Association

- belongs_to user
- has_many :comments
- has_one :order


## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | foreign_key: true              |
| item      | references | foreign_key: true              |

### Association

- belongs_to :user
- belongs_to :item


## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | foreign_key: true              |
| item      | references | foreign_key: true              |

### Association

- belongs_to :user
- belongs_to :item
- has_one :purchaser

## purchasers テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| postal_code            | string     | null: false                    |
| prefecture_id          | integer    | null: false                    |
| municipality           | string     | null: false                    |
| address                | string     | null: false                    |
| building_name          | string     |                                |
| phone_number           | string     | null: false                    |
| order                  | references | foreign_key: true              |

### Association

- belongs_to order

