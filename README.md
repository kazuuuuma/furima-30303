# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| fam_name_furigana  | string | null: false               |
| fst_name_furigana  | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :user_items
- has_many :items

## user_itemsテーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :destination

## itemsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | -------------------------------|
| product_name    | string     | null: false                    |
| profile         | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| charge_id       | integer    | null: false                    |
| days_to_ship_id | integer    | null: false                    |
| price           | string     | null: false                    |
| user            | references | foreign_key: true              |

### Association

- belongs_to :user

## Destinationテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postalcode    | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| bild          | string     |                                |
| phonenumber   | string     | null: false                    |
| user_item     | references | foreign_key: true              |

### Association

- belongs_to :user_item
