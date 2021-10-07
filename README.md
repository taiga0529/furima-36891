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
- has_many :shipping_information
- has_many :purchase_history

itemsテーブル

| name                | string      | null: false |  
| price               | integer     | null: false |   
| explanation_id         | integer      | null: false |  
| category_id            | integer      | null: false |  
| status_id              | integer      | null: false | 
| user                | references  | null: false ,foreign_key: true |  

Association

- belongs_to :users

shipping_informationテーブル

| postcode                  | string   | null: false |  
| prefectures               | string   | null: false |  
| municipalities            | string   | null: false |  
| address                   | string   | null: false |  
| building_name             | string   | null: false |  
| telephone_number          | string   | null: false | 
| shipping_address          | string   | null: false |  
| burden                    | string   | null: false |  
| area                      | string   | null: false | 
| days                      | date     | null: false |  
| user                      | references  | null: false ,foreign_key: true |

Association

- belongs_to :users

purchase_historyテーブル

| burden                    | string   | null: false |  
| area                      | string   | null: false | 
| days                      | date     | null: false |  
| user                      | references  | null: false ,foreign_key: true |

Association

- belongs_to :users
