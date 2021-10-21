FactoryBot.define do
  factory :purchase_address do
    area_id { '3' }
    postcode { "123-3333" }
    municipalities { "青区" }
    address { '青山1-1-1' }
    building_name { "アイウエオ" }
    telephone_number { "09087652341" }
    purchase_history_id { '6' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end