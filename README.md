# テーブル設計

## usersテーブル

| Column                           | Type   | Options                       |
| -------------------------------  | ------ | ----------------------------- |
| nickname                         | string | null: false
| email                            | string | null: false, unique: true     |
| encrypted_password               | string | null: false                   |
| first_name                       | string | null: false                   |
| last_name                        | string | null: false                   |
| first_name_kana                  | string | null: false                   |
| last_name_kana                   | string | null: false                   |
| birthday                         | date   | null: false                   |


### Association

- has_many :items
- has_many :orders

## itemsテーブル
## imageはActive Storage導入

| Column                           | Type       | Options                        |
| -------------------------------  | ---------- | -------------------------------|
| user                             | references | null: false, foreign_key: true |
| name                             | string     | null: false                    |
| description                      | text       | null: false                    |
| detail_category_id               | integer    | null: false                    |
| detail_commodity_condition_id    | integer    | null: false                    |
| delivery_burden_id               | integer    | null: false                    |
| region_id                        | integer    | null: false                    |
| days_to_ship_id                  | integer    | null: false                    |
| price                            | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order

### ordersテーブル

| Column                           | Type       | Options                        |
| -------------------------------  | ---------- | -------------------------------|
| user                             | references | null: false, foreign_key: true |
| item                             | references | null: false, foreign_key: true |
<!-- | credit_info                      | string     | null: false                    |
| card_info                        | text       | null: false                    |
| date_of_expire                   | text       | null: false                    |
| security                         | string     | null: false                    | -->

- belongs_to :user
- belongs_to :item
- has_one :address


### addressesテーブル

| Column                           | Type       | Options                        |
| -------------------------------  | ---------- | -------------------------------|
| post_code                        | string     | null: false                    |
| region_id                        | integer    | null: false                    |
| city                             | string     | null: false                    |
| address                          | string     | null: false                    |
| building_name                    | string     |                                |
| phone_num                        | string     | null: false                    |
| order                            | references | null: false, foreign_key: true |

### Association

- belongs_to :order