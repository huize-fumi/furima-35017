# README
## users テーブル
| Column         | Type   | Options          |
| -------------- | ------ | ---------------- |
| nickname       | string | null: false 　　　|
| password       | string | null: false 　　　|
| mail           | string | uniqueness: true |
| name_full      | text   | null: false      |
| name_kana      | text   | null: false      |
| birthday       | text   | null: false      |
| credit_number  | text   | null: false      |
| expiration     | text   | null: false      |
| code           | text   | null: false      |

### Association
- has_many :items
- has_many :records
- has_one  :sending

## records テーブル
| Column    | Type       | Options       |
| --------- | ---------- | ------------- |
| user      | reference  |               |
| item      | string     | null: false   |

### Association
- belongs_to :user
- has_one :items

## sendings テーブル
| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| user         | reference  |             |
| prefecture   | string     | null: false |
| city         | string     | null: false |
| postal       | text       | null: false |
| address      | text       | null: false |
| building     | text       | null: false |
| phone_number | text       | null: false |

### Association
- belongs_to :user

## items テーブル
| Column           | Type       | Options          |
| ---------------- | ---------- | ---------------- |
| user             | reference  |                  |
| product_name     | string     | null: false      |
| image            |            | ActiveStrorage   |
| description      | text       | null: false      |
| category         | text       | null: false      |
| status           | text       | null: false      |
| delivery_fee     | text       | null: false      |
| shipment_source  | text       | null: false      |
| days             | text       | null: false      |
| price            | text       | null: false      |

### Association
- belongs_to :user
- belongs_to :record
