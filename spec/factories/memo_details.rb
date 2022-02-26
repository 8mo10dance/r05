FactoryBot.define do
  factory :memo_detail do
    association :memo

    title { Faker::Lorem.paragraph }
  end
end
