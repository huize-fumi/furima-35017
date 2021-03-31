# README
## users テーブル
| Column              | Type   | Options          |
| ------------------- | ------ | ---------------- |
| nickname            | string | null: false      |
| encrypted_password  | string | null: false,     |
| email               | string | unique: true     |
| last_name           | string | null: false      |
| first_name          | string | null: false      |
| last_name_ruby      | string | null: false      |
| first_name_ruby     | string | null: false      |
| birthday            | date   | null: false      |


### Association
- has_many :items
- has_many :records


## archives テーブル
| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| user      | references | foreign_key: true |
| item      | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :order


## oerders テーブル
| Column               | Type       | Options           |
| -------------------- | ---------- | ----------------- |
| shipment_source_id   | integer    | null: false       |
| city                 | string     | null: false       |
| postal               | string     | null: false       |
| address              | string     | null: false       |
| building             | string     |                   |
| phone_number         | string     | null: false       |
| archive              | references | foreign_key: true |

### Association
- belongs_to :archive

## items テーブル
| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| user                | references | foreign_key: true |
| product_name        | string     | null: false       |
| description         | text       | null: false       |
| category_id         | integer    | null: false       |
| status_id           | integer    | null: false       |
| delivery_fee_id     | integer    | null: false       |
| shipment_source_id  | integer    | null: false       |
| day_id              | integer    | null: false       |
| price               | integer    | null: false       |

### Association
- belongs_to :user
- has_one    :record
