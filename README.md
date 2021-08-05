# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


```
### Get Customer Subscription Endpoint: 
#### Request Format:
```
`GET localhost:3000/api/v1/customers/:id/subscriptions`
get '/customers/:id/subscriptions', to:'subscriptions#index'
post "customers/:id/subscriptions", to: "subscriptions#create"
patch "/subscriptions/:id", to: "subscriptions#update"
```

#### Response Format:
```json
response_body = {
  "data": {
      "id": null,
      "type": "subscription",
      "attributes": {
          "subscription": {
              "title": "denver, co",
              "price": 20,
              "status": "Shipped"
            }
        }
    }
}
```