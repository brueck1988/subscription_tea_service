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
`GET localhost:3000/api/v1/customers/:customer_id/subscriptions?location=denver,co`
```
External APIs used: [Unsplash](https://api.unsplash.com)
#### Response Format:
```json
response_body = {
  "data": {
      "id": null,
      "type": "image",
      "attributes": {
          "image": {
              "location": "denver, co",
              "image_url": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?ixid=MnwyMzk1NjR8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkMlMjBjb3xlbnwwfHx8fDE2MjM3Nzg5NzU&ixlib=rb-1.2.1",
              "credit": {
                  "source": "unsplash.com",
                  "author": "Ryan De Hamer",
                  "logo": "https://unsplash.com/@rdehamer"
                }
            }
        }
    }
}
```