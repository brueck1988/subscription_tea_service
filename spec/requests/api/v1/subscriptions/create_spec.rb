require 'rails_helper'

RSpec.describe 'Create Customer Subscription API' do
  before :each do
    customer1 = create(:customer)
    customer2 = create(:customer)
    
    subscription1 = create(:subscription)
    subscription2 = create(:subscription)
    subscription3 = create(:subscription)
    subscription4 = create(:subscription)
    subscription5 = create(:subscription)
    
    tea1 = create(:tea)
    tea2 = create(:tea)
    tea3 = create(:tea)
    tea4 = create(:tea)
    tea5 = create(:tea)
    tea6 = create(:tea)
    tea7 = create(:tea)
    tea8 = create(:tea)
    tea9 = create(:tea)

    customer_subscription1 = CustomerSubscription.create!(customer_id: customer1.id, subscription_id: subscription1.id, status: "Active")
    customer_subscription2 = CustomerSubscription.create!(customer_id: customer1.id, subscription_id: subscription2.id, status: "Cancelled")
    customer_subscription3 = CustomerSubscription.create!(customer_id: customer2.id, subscription_id: subscription2.id, status: "Active")
    customer_subscription4 = CustomerSubscription.create!(customer_id: customer2.id, subscription_id: subscription3.id, status: "Cancelled")
    customer_subscription5 = CustomerSubscription.create!(customer_id: customer2.id, subscription_id: subscription4.id, status: "Active")
    
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
    it 'Adds subscription for a given customer' do
      headers = {'Content-Type': "application/json"}

      body = {
                "title": "Delicious subscription",
                "price": 30,
                "status": "available",
                "frequency": 14
              }

      post "/api/v1/customers/#{Customer.first.id}/subscriptions", headers: headers, params: body.to_json
      subscription = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(subscription[:data]).to be_a Hash
      expect(subscription[:data].count).to eq(3)
      expect(subscription[:data][:id]).to be_a String
      expect(subscription[:data][:type]).to eq("subscription")
      expect(subscription[:data][:attributes]).to be_a Hash
      expect(subscription[:data][:attributes].count).to eq(4)
      expect(subscription[:data][:attributes]).to have_key(:title)
      expect(subscription[:data][:attributes][:title]).to be_a String
      expect(subscription[:data][:attributes]).to have_key(:price)
      expect(subscription[:data][:attributes][:price]).to be_an Integer
      expect(subscription[:data][:attributes]).to have_key(:status)
      expect(subscription[:data][:attributes][:status]).to be_a String
      expect(subscription[:data][:attributes]).to have_key(:frequency)
      expect(subscription[:data][:attributes][:price]).to be_an Integer
    end
  end
end