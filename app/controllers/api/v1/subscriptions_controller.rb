class Api::V1::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    render json: CustomerSubscriptionSerializer.new(customer.subscriptions)
  end
  
  def create
    
  end

  def update
    
  end
end
