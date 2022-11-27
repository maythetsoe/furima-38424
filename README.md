# テーブル設計

## usersテーブル

| Column                           | Type   | Options                       |
| -------------------------------  | ------ | ----------------------------- |
| nickname                         | string | null: false
| email                            | string | null: false, unique: true     |
| encrypted_password               | string | null: false                   |
| first_name                       | text   | null: false                   |
| last_name                        | text   | null: false                   |
| first_name_kana                  | text   | null: false                   |
| last_name_kana                   | text   | null: false                   |
| birthday_year                    | text   | null: false                   |
| birthday_month                   | text   | null: false                   |
| birthday_day                     | text   | null: false                   |

### Association

- has_many :items
- has_many :orders
- has_one :address

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
| delivery_area_id                 | integer    | null: false                    |
| days_to_ship_id                  | integer    | null: false                    |
| price                            | text       | null: false                    |

### Association

- belongs_to :user

### ordersテーブル

| Column                           | Type       | Options                        |
| -------------------------------  | ---------- | -------------------------------|
| credit_info                      | string     | null: false                    |
| card_info                        | text       | null: false                    |
| date_of_expire                   | text       | null: false                    |
| security                         | string     | null: false                    |

- belongs_to :user


### addressesテーブル

<!-- | delivery_address                 | string     | null: false                    | -->
| post_code                        | string     | null: false                    |
| prefecture                       | integer    | null: false                    |
| city                             | string     | null: false                    |
| address                          | string     | null: false                    |
| building_name                    | string     | null: false                    |
| phone_num                        | string     | null: false                    |

### Association

- belongs_to :user