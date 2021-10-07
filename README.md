# README

usersテーブル

| email                 | string | null: false ,unique:true|  
| name                  | string | null: false |  
| encrypted_password    | string | null: false |  
| first_name            | string | null: false |  
| last_name             | string | null: false |  
| first_name_kana       | string | null: false | 
| last_name_kana        | string | null: false |  
| birth_day             | date   | null: false |  

Association

- has_many :items
- has_many :purchase_histories

itemsテーブル

| name                | string      | null: false |  
| price               | integer     | null: false 
| explanation         | text      | null: false |  
| category_id            | integer      | null: false |  
| status_id              | integer      | null: false | 
| burden_id                    | integer   | null: false |  
| area_id                      | integer   | null: false | 
| days_id                      | integer   | null: false |  
| user                | references  | null: false ,foreign_key: true |  

Association

- belongs_to :user
- has_one :purchase_histories

addressesテーブル

| postcode                  | string   | null: false |  
| area_id                      | integer   | null: false | 
| municipalities            | string   | null: false |  
| address                   | string   | null: false |  
| building_name             | string   |  
| telephone_number          | string   | null: false | 
| purchase_history          | references  | null: false ,foreign_key: true |

Association

- belongs_to :purchase_histories

purchase_historiesテーブル

| user                      | references  | null: false ,foreign_key: true |
| item                      | references  | null: false ,foreign_key: true |

Association

- belongs_to :user
- has_one :address
- belongs_to :item