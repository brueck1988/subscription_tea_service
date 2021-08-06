require 'rails_helper'

RSpec.describe 'Get Customer Subscriptions API' do
  before :each do
    customer1 = create(:customer)
    customer2 = create(:customer)
    
    subscription1 = create(:subscription)
    subscription2 = create(:subscription)
    subscription3 = create(:subscription)
    subscription4 = create(:subscription)
    
    tea1 = create(:tea)
    tea2 = create(:tea)
    tea3 = create(:tea)
    tea4 = create(:tea)
    tea5 = create(:tea)
    tea6 = create(:tea)
    tea7 = create(:tea)
    tea8 = create(:tea)
    tea9 = create(:tea)

    customer_subscription1 = CustomerSubscription.create!(customer_id: customer1.id, subscription_id: subscription1.id)
    customer_subscription2 = CustomerSubscription.create!(customer_id: customer1.id, subscription_id: subscription2.id)
    customer_subscription3 = CustomerSubscription.create!(customer_id: customer2.id, subscription_id: subscription2.id)
    customer_subscription4 = CustomerSubscription.create!(customer_id: customer2.id, subscription_id: subscription3.id)
    customer_subscription5 = CustomerSubscription.create!(customer_id: customer2.id, subscription_id: subscription4.id)
    
    subscription_tea1 = SubscriptionTea.create!(subscription_id: subscription1.id, tea_id: tea1.id)
    subscription_tea2 = SubscriptionTea.create!(subscription_id: subscription1.id, tea_id: tea2.id)
    subscription_tea3 = SubscriptionTea.create!(subscription_id: subscription1.id, tea_id: tea3.id)
    subscription_tea4 = SubscriptionTea.create!(subscription_id: subscription2.id, tea_id: tea3.id)
    subscription_tea5 = SubscriptionTea.create!(subscription_id: subscription2.id, tea_id: tea4.id)
    subscription_tea6 = SubscriptionTea.create!(subscription_id: subscription2.id, tea_id: tea5.id)
    subscription_tea7 = SubscriptionTea.create!(subscription_id: subscription3.id, tea_id: tea6.id)
    subscription_tea8 = SubscriptionTea.create!(subscription_id: subscription3.id, tea_id: tea7.id)
    subscription_tea7 = SubscriptionTea.create!(subscription_id: subscription4.id, tea_id: tea8.id)
    subscription_tea8 = SubscriptionTea.create!(subscription_id: subscription4.id, tea_id: tea9.id)
  end
  
  describe 'Happy path' do
    it 'sends subscription info for a given customer' do
      customer1 = Customer.first
      get "/api/v1/customers/#{customer1.id}/subscriptions"
      customer_subscriptions = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(customer_subscriptions[:data]).to be_a(Array)
      expect(customer_subscriptions[:data].count).to eq(2)
      expect(customer_subscriptions[:data][0][:id]).to be_a String
      expect(customer_subscriptions[:data][0][:type]).to eq("customer_subscription")
      expect(customer_subscriptions[:data][0][:attributes]).to be_a Hash
      expect(customer_subscriptions[:data][0][:attributes].count).to eq(4)
      expect(customer_subscriptions[:data][0][:attributes]).to have_key(:title)
      expect(customer_subscriptions[:data][0][:attributes][:title]).to be_a String
      expect(customer_subscriptions[:data][0][:attributes]).to have_key(:price)
      expect(customer_subscriptions[:data][0][:attributes][:price]).to be_an Integer
      expect(customer_subscriptions[:data][0][:attributes]).to have_key(:status)
      expect(customer_subscriptions[:data][0][:attributes][:status]).to be_a String
      expect(customer_subscriptions[:data][0][:attributes]).to have_key(:frequency)
      expect(customer_subscriptions[:data][0][:attributes][:price]).to be_an Integer
    end
  end
end