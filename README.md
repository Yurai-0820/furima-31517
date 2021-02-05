# FurimaのER図

## users テーブル

| Column        | Type     | Options     |
| ------------- | -------- | ----------- |
| nickname      | string   | null: false |
| email         | string   | null: false |
| password      | string   | null: false |
| name          | string   | null: false |
| name_kana     | string   | null: false |
| birthday      | pulldown | null: false |

### Association

- has_many :items
- has_many :comments
- has_one :purchaser


## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| items_name        | string     | null: false                    |
| items_description | text       | null: false                    |
| category          | pulldown   | null: false                    |
| items_condition   | pulldown   | null: false                    |
| shipping_charges  | pulldown   | null: false                    |
| days_to_ship      | pulldown   | null: false                    |
| price             | string     | null: false                    |
| user              | references | foreign_key: true              |

### Association

- belongs_to user
- has_many :comments
- has_one :purchaser


## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | foreign_key: true              |
| item      | references | foreign_key: true              |

### Association

- belongs_to :user
- belongs_to :item


## purchasers テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| credit_card_infomation | string     | null: false                    |
| expiration_date        | string     | null: false                    |
| security_code          | string     | null: false                    |
| postal_code            | string     | null: false                    |
| prefectures            | pulldown   | null: false                    |
| municipality           | string     | null: false                    |
| address                | string     | null: false                    |
| building name          | string     |                                |
| phone_number           | string     | null: false                    |
| user                   | references | foreign_key: true              |
| item                   | references | foreign_key: true              |

### Association

- belongs_to user
- belongs_to item

