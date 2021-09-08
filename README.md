# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last-name          | string | null: false |
| first-name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders


## items テーブル
 
| Column                      | Type       | Options     |
| ------------------          | ------     | ----------- |
| item_name                   | string     | null: false |
| item_info                   | text       | null: false |
| item_category_id            | integer    | null: false |
| item_sales-status_id        | integer    | null: false |
| item_shipping-fee-status_id | integer    | null: false |
| item_prefecture_id          | integer    | null: false |
| item_scheduled-delivery_id  | integer    | null: false |
| item_price                  | integer    | null: false |
| user                     | references |foreign_key:true|    

### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column         | Type       | Options           |
| ------         | ---------- | -----------       |
| user           | references | foreign_key: true |
| item           | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :residence


## residences テーブル

| Column                | Type        | Options     |
| ------------------    | ------      | ----------- |
| postal_code           | string      | null: false |
| item_prefecture_id    | integer     | null: false |
| city                  | string      | null: false |
| addresses             | string      | null: false |
| building              | string      | null: false |
| phone_number          | string      | null: false |
| order           | references  | foreign_key: true |

### Association

- belongs_to :order
