# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last-name          | string | null: false |
| first-name         | string | null: false |
| last-name-kana     | string | null: false |
| first-name-kana    | string | null: false |
| birth-year         | date   | null: false |
| birth-month        | date   | null: false |
| birth-day          | date   | null: false |

### Association

- has_many :items
- has_many :orders


## items テーブル
 
| Column                      | Type       | Options     |
| ------------------          | ------     | ----------- |
| item-name                   | text       | null: false |
| item-info                   | text       | null: false |
| item-category_id            | integer    | null: false |
| item-sales-status_id        | integer    | null: false |
| item-shipping-fee-status_id | integer    | null: false |
| item-prefecture_id          | integer    | null: false |
| item-scheduled-delivery_id  | integer    | null: false |
| item-price                  | integer    | null: false |
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
- has_one :postal-code


## postal-codes テーブル

| Column                | Type        | Options     |
| ------------------    | ------      | ----------- |
| prefecture            | integer     | null: false |
| city                  | string      | null: false |
| addresses             | string      | null: false |
| building              | string      | null: false |
| phone-number          | integer     | null: false |
| order           | references  | foreign_key: true |

### Association

- belongs_to :order
