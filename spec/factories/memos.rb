# frozen_string_literal: true

FactoryBot.define do
  factory :memo do
    association :user

    title { Faker::Lorem.sentence }
  end
end
