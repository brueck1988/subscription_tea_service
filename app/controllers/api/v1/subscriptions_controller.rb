class Api::V1::SubscriptionsController < ApplicationController
  before_action :find_customer
  
  def index
    render json: SubscriptionSerializer.new(@customer.subscriptions)
  end
  
  def create
    subscription = @customer.subscriptions.create(subscription_params)
    render json: SubscriptionSerializer.new(subscription), status: :created
  end

  def update
    
  end
  
  private
  
  def subscription_params
    params.permit(:title, :price, :status, :frequency)
  end
  
  def find_customer
    @customer = Customer.find(params[:customer_id])
  end
end
