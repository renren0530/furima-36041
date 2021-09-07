# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last-name          | string | null: false |
| first-name         | string | null: false |
| last-name-kana     | string | null: false |
| first-name-kana    | string | null: false |

### Association

- has_many :items


## items テーブル
 
| Column                    | Type       | Options     |
| ------------------        | ------     | ----------- |
| item-name                 | text       | null: false |
| item-info                 | text       | null: false |
| item-category             | string     | null: false |
| item-sales-status         | string     | null: false |
| item-shipping-fee-status  | string     | null: false |
| item-prefecture           | string     | null: false |
| item-scheduled-delivery   | string     | null: false |
| item-price                | integer    | null: false |
| user_id                   | references |             |

### Association

- belongs_to :user


## orders テーブル

| Column         | Type       | Options     |
| ------         | ---------- | ----------- |
| card-number    | integer    | null: false |
| card-exp-month | integer    | null: false |
| card-exp-year  | integer    | null: false |
| card-cvc       | integer    | null: false |

### Association

- has_one :postal-code


## postal-codes テーブル

| Column                | Type        | Options     |
| ------------------    | ------      | ----------- |
| prefecture            | integer     | null: false |
| city                  | string      | null: false |
| addresses             | string      | null: false |
| building              | string      | null: false |
| phone-number          | integer     | null: false |
| order_id              | references  |             |


### Association

- belongs_to :order
