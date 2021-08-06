# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email {Faker::Internet.email}
    address {Faker::Address.street_address}
  end

  factory :subscription do
    title { "#{Faker::Tea.variety} subscription" }
    price { Faker::Commerce.price(range: 0..45) }
    status { ["sold out", "available", "discontinued"].sample }
    frequency {rand(0..14)}
  end

  factory :tea do
    title {Faker::Tea.variety}
    description {Faker::Coffee.notes}
    temperature {Faker::Commerce.price(range: 110..170)}
    brew_time {Faker::Commerce.price(range: 1..20)}
  end

  factory :subscription_tea do
    subscription
    tea
  end

  factory :customer_subscription do
    customer
    subscription
  end
end
