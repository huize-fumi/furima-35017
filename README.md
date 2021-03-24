# README
## users テーブル
| Column              | Type   | Options          |
| ------------------- | ------ | ---------------- |
| nickname            | string | null: false 　　　|
| encrypted_password  | string | null: false 　　　|
| email               | string | unique: true     |
| name_full           | string | null: false      |
| name_kana           | string | null: false      |
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
- has_one :item
- has_one :sending


## sendings テーブル
| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| prefecture   | integer    | null: false |
| city         | string     | null: false |
| postal       | string     | null: false |
| address      | string     | null: false |
| building     | string     |             |
| phone_number | string     | null: false |

### Association
- belongs_to :record

## items テーブル
| Column           | Type       | Options          |
| ---------------- | ---------- | ---------------- |
| user             | reference  |                  |
| product_name     | string     | null: false      |
| description      | text       | null: false      |
| categories_id    | integer    | null: false      |
| status           | text       | null: false      |
| delivery_fee     | text       | null: false      |
| shipment_source  | text       | null: false      |
| days             | text       | null: false      |
| price            | integer    | null: false      |

### Association
- belongs_to :user
- belongs_to :record
