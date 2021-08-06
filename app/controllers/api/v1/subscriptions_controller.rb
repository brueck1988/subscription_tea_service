class Api::V1::SubscriptionsController < ApplicationController
  before_action :find_customer
  
  def index
    render json: CustomerSubscriptionSerializer.new(@customer.customer_subscriptions), status: :ok
  end
  
  def create
    subscription = @customer.subscriptions.create(subscription_params)
    customer_subscription = subscription.customer_subscriptions.last
    customer_subscription.update(status: "Active")
    render json: CustomerSubscriptionSerializer.new(customer_subscription), status: :created
  end

  def update
    customer_subscription = CustomerSubscription.find_by({customer_id: params[:customer_id], subscription_id: params[:id]})
    updated = CustomerSubscription.update(customer_subscription.id, status: params[:subscription][:status])
    render json: CustomerSubscriptionSerializer.new(updated), status: :ok
  end
  
  private
  
  def subscription_params
    params.permit(:title, :price, :status, :frequency)
  end
  
  def find_customer
    @customer = Customer.find(params[:customer_id])
  end
end
