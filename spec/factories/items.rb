FactoryBot.define do
  factory :item do
    name { '絵本' }
    explanation { 'これは絵本です' }
    price { '2000' }
    category_id { '2' }
    area_id { '3' }
    burden_id { '2' }
    days_id { '2' }
    status_id { '2' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
