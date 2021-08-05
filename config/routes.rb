Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :customers, only: [] do
        resources :subscriptions, only: [:create, :update, :index]
      end
    end
  end
end

# An endpoint to see all of a customer’s subsciptions (active and cancelled)
#GET   /api/v1/customers/:customer_id/subscriptions(.:format) to: 'api/v1/subscriptions#index'

# An endpoint to subscribe a customer to a tea subscription
#PUT   /api/v1/customers/:customer_id/subscriptions/:id(.:format) to: 'api/v1/subscriptions#update'

# An endpoint to cancel a customer’s tea subscription
#PATCH /api/v1/customers/:customer_id/subscriptions/:id(.:format) to: 'api/v1/subscriptions#update'