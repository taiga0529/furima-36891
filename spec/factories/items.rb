FactoryBot.define do
  factory :item do
    explanation {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    association :user 
  end
end
