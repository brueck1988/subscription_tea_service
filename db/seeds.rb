# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# SubscriptionTea.destroy_all
# CustomerSubscription.destroy_all
# Subscription.destroy_all
# Tea.destroy_all
# Customer.destroy_all

5.times do
  Customer.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    address: Faker::Address.street_address
  )
end

15.times do
  Subscription.create!(
    title: "#{Faker::Tea.variety} subscription",
    price: Faker::Commerce.price(range: 0..45),
    status: ["sold out", "available", "discontinued"].sample,
    frequency: rand(0..14)
  )
end

10.times do
  Tea.create!(
    title: Faker::Tea.variety,
    description: Faker::Coffee.notes,
    temperature: Faker::Commerce.price(range: 110..170),
    brew_time: Faker::Commerce.price(range: 1..20),
  )
end

customer_subscription1 = CustomerSubscription.create!(customer_id: 1, subscription_id: 1, status: "Active")
customer_subscription2 = CustomerSubscription.create!(customer_id: 1, subscription_id: 2, status: "Cancelled")
customer_subscription3 = CustomerSubscription.create!(customer_id: 2, subscription_id: 2, status: "Active")
customer_subscription4 = CustomerSubscription.create!(customer_id: 2, subscription_id: 3, status: "Cancelled")
customer_subscription5 = CustomerSubscription.create!(customer_id: 2, subscription_id: 4, status: "Active")

subscription_tea1 = SubscriptionTea.create!(subscription_id: 1, tea_id: 1)
subscription_tea2 = SubscriptionTea.create!(subscription_id: 1, tea_id: 2)
subscription_tea3 = SubscriptionTea.create!(subscription_id: 1, tea_id: 3)
subscription_tea4 = SubscriptionTea.create!(subscription_id: 2, tea_id: 3)
subscription_tea5 = SubscriptionTea.create!(subscription_id: 2, tea_id: 4)
subscription_tea6 = SubscriptionTea.create!(subscription_id: 2, tea_id: 5)
subscription_tea7 = SubscriptionTea.create!(subscription_id: 3, tea_id: 6)
subscription_tea8 = SubscriptionTea.create!(subscription_id: 3, tea_id: 7)
subscription_tea7 = SubscriptionTea.create!(subscription_id: 4, tea_id: 8)
subscription_tea8 = SubscriptionTea.create!(subscription_id: 4, tea_id: 9)