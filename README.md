# README
## users テーブル
| Column              | Type   | Options          |
| ------------------- | ------ | ---------------- |
| nickname            | string | null: false 　　　|
| encrypted_password  | string | null: false 　　　|
| email               | string | unique: true     |
| last_name           | string | null: false      |
| first_name          | string | null: false      |
| last_name_ruby      | string | null: false      |
| first_name_ruby     | string | null: false      |
| birthday            | date   | null: false      |


### Association
- has_many :items
- has_many :records


## records テーブル
| Column    | Type       | Options       |
| --------- | ---------- | ------------- |
| user      | references |               |
| item      | references |               |

### Association
- belongs_to :user
- belongs_to :item
- has_one :sending


## sendings テーブル
| Column               | Type       | Options           |
| -------------------- | ---------- | ----------------- |
| shipment_source_id   | integer    | null: false       |
| city                 | string     | null: false       |
| postal               | string     | null: false       |
| address              | string     | null: false       |
| building             | string     |                   |
| phone_number         | string     | null: false       |
| record               | reference  | foreign_key: true |

### Association
- belongs_to :record

## items テーブル
| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| user                | reference  | foreign_key: true |
| product_name        | string     | null: false       |
| description         | text       | null: false       |
| categories_id       | integer    | null: false       |
| status_id           | integer    | null: false       |
| delivery_fee_id     | integer    | null: false       |
| shipment_source_id  | integer    | null: false       |
| days_id             | integer    | null: false       |
| price               | integer    | null: false       |

### Association
- belongs_to :user
- has_one    :record
