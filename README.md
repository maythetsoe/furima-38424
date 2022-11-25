# テーブル設計

## usersテーブル

| Column                           | Type   | Options                       |
| -------------------------------  | ------ | ----------------------------- |
| nickname                         | string | null: false
| email                            | string | null: false                   |
| encrypted_password               | string | null: false, unique: true     |
| first_name                       | text   | null: false                   |
| last_name                        | text   | null: false                   |
| first_name_kana                  | text   | null: false                   |
| last_name_kana                   | text   | null: false                   |
| birthday_year                    | text   | null: false                   |
| birthday_month                   | text   | null: false                   |
| birthday_day                     | text   | null: false                   |

### Association

- has_many :items
- has_many :comments
- has_one :purchase

## itemsテーブル
## imageはActive Storage導入

| Column                           | Type       | Options                        |
| -------------------------------  | ---------- | -------------------------------|
| name                             | string     | null: false                    |
| description                      | text       | null: false                    |
| detail_category                  | text       | null: false                    |
| detail_commodity_condition       | string     | null: false                    |
| delivery_burden                  | string     | null: false                    |
| delivery_area                    | string     | null: false                    |
| days_to_ship                     | string     | null: false                    |

### Association

- belongs_to :user
- has_many :comments

## commentsテーブル

| Column                           | Type       | Options                        |
| -------------------------------  | ---------- | -------------------------------|
| content                          | text       | null: false                    |
| user                             | references | null: false, foreign_key: true |

### Associtaion

- belongs_to :user
- belongs_to :item

### purchasesテーブル

| Column                           | Type       | Options                        |
| -------------------------------  | ---------- | -------------------------------|
| credit_info                      | string     | null: false                    |
| card_info                        | text       | null: false                    |
| date_of_expire                   | text       | null: false                    |
| security                         | string     | null: false                    |
| delivery_address                 | string     | null: false                    |
| post_code                        | string     | null: false                    |
| city                             | string     | null: false                    |
| address                          | string     | null: false                    |
| building_name                    | string     | null: false                    |
| phone_num                        | string     | null: false                    |

### Association

- belong_to :user