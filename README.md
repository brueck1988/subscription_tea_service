# README
## Schema
![schema](https://i.ibb.co/6rrx29M/Screen-Shot-2021-08-05-at-11-06-57-AM.png)

## Endpoints
### 1. Get Customer Subscription Endpoint: An endpoint to see all of a customer’s subscriptions (active and cancelled)

#### Request Format:
```
`GET /api/v1/customers/:id/subscriptions`
```

#### Response Format:
```json
response_body = {
                :data=> [
                {:id=>"248",
                  :type=>"customer_subscription",
                  :attributes=>
                   {:customer_id=>103, :subscription_id=>238, :status=>"Active"}},
                 {:id=>"249",
                  :type=>"customer_subscription",
                  :attributes=>
                   {:customer_id=>103, :subscription_id=>239, :status=>"Cancelled"}}
                   ]
                 }
```

### 2. POST Customer Subscription Endpoint: An endpoint to subscribe a customer to a tea(s)
#### Request Format:

`POST /api/v1/customers/:customer_id/subscriptions`

```json
request_body = {
                  "title": "Delicious subscription",
                  "price": 30,
                  "status": "available",
                  "frequency": 14
                }
```

#### Response Format:
```json
response_body = {
                  :data=>
                  {:id=>"322",
                   :type=>"customer_subscription",
                   :attributes=>{:customer_id=>129, :subscription_id=>304, :status=>"Active"}}
                 }
```


### 3. PATCH Customer Subscription Endpoint: An endpoint to cancel a customer’s tea subscription
#### Request Format:

`PATCH /api/v1/customers/:customer_id/subscriptions/:id`
```json
request_body = {
                "status": "Cancelled"
               }
```

#### Response Format:
```json
response_body = {:data=>
  {:id=>"388",
   :type=>"customer_subscription",
   :attributes=>
    {:customer_id=>155, :subscription_id=>363, :status=>"Cancelled"}}}
```
