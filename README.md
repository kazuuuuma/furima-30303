# テーブル設計

## usersテーブル

| Column     | Type   | Options     |
| ---------- | ------ | ------------|
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| family_name| string | null: false |
| first_name | string | null: false |
| birthday   | string | null: false |

### Association

- has_many :items
- has_many :buys

## itemsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | -------------------------------|
| product_name | string     | null: false                    |
| profile      | text       | null: false                    |
| category     | string     | null: false                    |
| condition    | string     | null: false                    |
| charge       | string     | null: false                    |
| days_to_ship | string     | null: false                    |
| price        | string     | null: false                    |
| fee          | string     | null: false                    |
| profit       | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| buy          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## Buysテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | -------------------------------|
| creditcard   | string     | null: false                    |
| postalcode   | string     | null: false                    |
| prefecture   | string     | null: false                    |
| municipality | string     | null: false                    |
| address      | string     | null: false                    |
| phonenumber  | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
