# README
## Schema
![schema](https://i.ibb.co/6rrx29M/Screen-Shot-2021-08-05-at-11-06-57-AM.png)

##Endpoints
```
### 1. Get Customer Subscription Endpoint: An endpoint to see all of a customer’s subscriptions (active and cancelled) subscription
#### Request Format:
```
`GET /api/v1/customers/:id/subscriptions`
```

#### Response Format:
```json
response_body = {
  :data=>
  [
  {:id=>"194",
    :type=>"subscription",
    :attributes=>
     {:title=>"Shou Mei subscription",
      :price=>0,
      :status=>"discontinued",
      :frequency=>7}},
   {:id=>"195",
    :type=>"subscription",
    :attributes=>
     {:title=>"Bai Mu Dan subscription",
      :price=>42,
      :status=>"sold out",
      :frequency=>4}}
      ]
    }
```

```
### 2. POST Customer Subscription Endpoint: An endpoint to subscribe a customer to a tea
#### Request Format:
```
`PUT   /api/v1/customers/:customer_id/subscriptions/:id`
```

#### Response Format:
```json
response_body = {
  "data": {
      "id": 1,
      "type": "customer",
      "attributes": {
          "first_name": "Bridget",
          "last_name": "Beer",
          "email": "cesar@mosciski.biz",
          "address": "45757 Rolande Ramp",
          
          "subscription": [
          {
              "id": 1,
              "title": "Fujian New Craft subscription",
              "price": 32,
              "status": "sold out"
            },
          {
              "id": 2,
              "title": "Goji subscription",
              "price": 32,
              "status": "discontinued"
            },
          {
              "id": 3,
              "title": "Yi Zhen Bai Hao subscription",
              "price": 19,
              "status": "sold out"
            }
            ]
        }
    }
}
```

```
### 3. PATCH Customer Subscription Endpoint: An endpoint to cancel a customer’s tea subscription
#### Request Format:
```
`PATCH /api/v1/customers/:customer_id/subscriptions/:id`
```

#### Response Format:
```json
response_body = {
  "data": {
      "id": 1,
      "type": "customer",
      "attributes": {
          "first_name": "Bridget",
          "last_name": "Beer",
          "email": "cesar@mosciski.biz",
          "address": "45757 Rolande Ramp",
          
          "subscription": [
          {
              "id": 1,
              "title": "Fujian New Craft subscription",
              "price": 32,
              "status": "sold out"
            },
          {
              "id": 2,
              "title": "Goji subscription",
              "price": 32,
              "status": "discontinued"
          }
            ]
        }
    }
}
```
