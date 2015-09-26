  Prefix | Verb   | URI Pattern             | Controller#Action
 --------|--------|-------------------------|------------------
  access | POST   | /access(.:format)       | access#create
profiles | POST   | /profiles(.:format)     | profiles#create
 profile | GET    | /profiles/:id(.:format) | profiles#show
         | PATCH  | /profiles/:id(.:format) | profiles#update
         | PUT    | /profiles/:id(.:format) | profiles#update
         | DELETE | /profiles/:id(.:format) | profiles#destroy
    user | POST   | /user(.:format)         | user#create
         | GET    | /user(.:format)         | user#show
         | PATCH  | /user(.:format)         | user#update
         | PUT    | /user(.:format)         | user#update

### POST /access

#### Request

```http
POST /access HTTP/1.1
Accept: application/json

{ 
  "email": "angry_bowling@gmail.com",
  "password": "my secret password"
}
```

    Type  | Parameter Name | Description 
  --------|---------------:|:------------
   string|**email**| account password
   string|**password**| 

#### Response

```http
HTTP/1.1 201 Created
Content-Type: application/json

{
  "access_token": "s0lksjd098usdlfkjhso8lk"
}
```

    Type  | Parameter Name | Description 
  --------|---------------:|:------------
 string |**access_token**| authentication token last 2 weeks to be used on subsequent requests

### POST /profiles

#### Request

```http
POST /profiles HTTP/1.1
Accept: application/json

{ 
  "name": "Mom"
}
```

    Type  | Parameter Name | Description 
  --------|---------------:|:------------
   string|**name**| Individiual profile name

#### Response

```http
HTTP/1.1 201 Created
Content-Type: application/json

{
  "id":4,
  "name":"Dad",
  "user_id":16,
  "created_at":"2015-09-25T21:54:31.509Z",
  "updated_at":"2015-09-25T21:54:31.509Z"
}
```

    Type  | Parameter Name | Description 
  --------|---------------:|:------------
 integer |**id**| profile id
   string|**name**| Individiual profile name
 integer |**user_id**| Account id
 datetime|**created_at**| When the profile was created
 datetime|**updated_at**| When the profile was updated





















### GET /api/v1/card

#### Request

```http
GET /api/v1/card HTTP/1.1
Accept: application/json
```

#### Response

```http
HTTP/1.1 200 OK
Content-Type: application/json

{ 
  "card": {
    "stripe_id": "card_s09lnknsg09ikjs0d9gu",
    "exp_month": 10,
    "exp_year": 2016,
    "name": "Karen Important",
    "last_four": "1050"
  }
}
```

    Type  | Parameter Name | Description 
  --------|---------------:|:------------
   string|**stripe_id**| Stripe ID for the card
  integer|**exp_month**| month the card expires
  integer|**exp_year**| year the card expires
   string|**name**| name on the card
   string|**last_four**| last four digits of the card


### GET /api/v1/invoices

#### Request

```http
GET /api/v1/invoices HTTP/1.1
Accept: application/json
```

#### Response

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "invoices": [
    {
      "id": 1,
      "balance": 100000,
      "month": timestamp,
      "state": "closed"
    },
    { ... }, 
    ...
  ]
}
```

    Type  | Parameter Name | Description 
  --------|---------------:|:------------
   integer|          **id**| Invoice ID
   integer|     **balance**| spend during that month
  datetime|       **month**| Timestamp when invoice started, this will be the first day of the month
    string|       **state**| state machine value: ['open', 'invoicing', 'closed']

### GET /api/v1/monthly-caps/current

#### Request

```http
GET /api/v1/monthly-caps/current HTTP/1.1
Accept: application/json
```

#### Response

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "monthly_cap": {
    "id": 1,
    "limit": 100000,
    "created_at": timestamp,
    "projected_annual": 1200000,
    "projected_eoy": 650000,
    "spent_this_month": 50000,
    "invoice_totals_so_far": 0,
    "rollover_balance": 4500,
    "available": 104500,
    "admin": { user }
  }
}
```

    Type  | Parameter Name | Description 
  --------|---------------:|:------------
   integer|          **id**| MonthlyCap ID
   integer|       **limit**| cap amount in cents
  datetime|  **created_at**| Timestamp when cap was initially set
   integer|       **projected_annual**| projected annual amount in cents, the limit * 12
   integer|       **projected_eoy**| amount in cents, past spend + current monthly spend + the rest of the year at the limit
   integer|       **spent_this_month**| current spend this month amount in cents
   integer|       **invoice_totals_so_far**| spend this year without current month amount in cents 
   integer| **rollover_balance**| roll over from last month
   integer| **available** | roll over plus limit
 [User](User-Information#get-apiv1usersid)|**admin**| User object of Admin that created the monthly cap

### POST /api/v1/monthly-caps

#### Request

```http
POST /api/v1/monthly-cpas HTTP/1.1
Accept: application/json

{ 
  "monthly_cap": {
    "limit": 1000
  }
}
```

#### Response

```http
HTTP/1.1 201 Created
Content-Type: application/json

{
  "monthly_cap": { monthly_cap }
}
```

    Type  | Parameter Name | Description 
  --------|---------------:|:------------
 [MonthlyCap](#post-apiv1monthly-caps)|**monthly-cap**| the monthly cap object being created

### POST /api/v1/users/1/privileges

#### Request

```http
POST /api/v1/users/1/privileges HTTP/1.1
Accept: application/json

{
  "privilege": {
    "privilege_level_id": 1
  }
}
```

    Type  | Parameter Name | Description 
  --------|---------------:|:------------
   integer|**privilege_level_id**| privilege level object id

#### Response

```http
HTTP/1.1 201 Created
Content-Type: application/json

{
  "privilege": {
    "privilege_level": privilege_level,
    "admin": user,
    "company": company,
    "user": user
  }
}
```

    Type  | Parameter Name | Description 
  --------|---------------:|:------------
 [Privilege Level](#post-apiv1users1privileges)|**privilege_level**| Privilege level object being set
 [User](User-Information#get-apiv1usersid)|**admin**| User object of Admin that created the privilege
 [Company](Company#get-apiv1company)|**company**| Company the user will have privileges
 [User](User-Information#get-apiv1usersid)|**user**| User being set to the specific privilege

### GET /api/v1/privilege-levels

#### Request

```http
GET /api/v1/privilege-levels HTTP/1.1
Accept: application/json
```

#### Response

```http
HTTP/1.1 200 Ok
Content-Type: application/json

{
  "privilege_levels": [
    {
      "id": 1,
      "max_amount": 0
    },{
      "id": 2,
      "max_amount": 10
    }
  ]
}
```

    Type  | Parameter Name | Description 
  --------|---------------:|:------------
   integer| id             | id to use when creating a privilege
   integer| max_amount     | cent based amount a user can gift

### GET /api/v1/value-fees

#### Request

```http
GET /api/v1/value-fees HTTP/1.1
Accept: application/json
```

#### Response

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  [
    {
      "value": 500,
      "fee": 129
    },
    {
      "value": 1000,
      "fee": 249
    },
    ...
  ]
}
```

    Type  | Parameter Name | Description 
  --------|---------------:|:------------
   integer|       **value**| amount in cents of a reward
   integer|         **fee**| amount in cents of resulting fee

### GET /api/v1/gift-cards

#### Request

```http
GET /api/v1/gift-cards HTTP/1.1
Accept: application/json
```

#### Response

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "gift_cards": [
    {
      "id": 3,
      "thank_url": "https://www.gratzi.com/api/v1/thanks/2",
      "created_at": timestamp,
      "from": user,
      "brand": {
        "description": "Amazon.com"
      },
      "reward": reward
      "spent_status": boolean
    },
    ...
  ]
}
```

    Type  | Parameter Name | Description 
  --------|---------------:|:------------
   integer|          **id**| Gift Card id
       url|   **thank_url**| gift cards thank url 
 timestamp|  **created_at**| creation timestamp
 [User](User-Information#get-apiv1usersid)|**from**| The user that gave the thank/gift card
    string|**brand.description**| Brand name
 [Reward](#get-apiv1gift-cards)|**reward**| Reward details including unit_price and sku
boolean |**spent_status**| Status showing if giftcard money is fully spent

### GET /api/v1/gift-cards/:id

#### REQUEST
```http
GET /api/v1/gift-cards/:id HTTP/1.1
Accept: application/json
```
#### RESPONSE
```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "gift_card": 
    {
      "id": 3,
      "thank_url": "https://www.gratzi.com/api/v1/thanks/2",
      "created_at": timestamp,
      "from": user,
      "brand": {
        "description": "Amazon.com"
      },
      "reward": reward
      "spent_status": boolean
    },
}
```




### PUT/PATCH /api/v1/gift-cards/:id

#### REQUEST
```http
PUT /api/v1/gift-cards/1 HTTP/1.1
Accept: application/json
Content-Type: application/json

{
  "gift_card": {
    "spent_status": boolean
  }
}
```
 Type  | Parameter Name | Description 
  --------|---------------:|:------------
boolean |**spent_status**| Status showing if giftcard money is fully spent

#### Response 

```http
HTTP/1.1 204 No Content
```

### GET /api/v1/reports/receiving?month=2014-05-01

#### Request

```http
GET /api/v1/reports/receiving?month=2014-05-01
Accept: application/json
```

    Type  | Parameter Name | Description 
  --------|---------------:|:------------
   datetime|          **month**| month of logs returns, when omitted, defaults to current month

#### Response

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "receiving_logs": [
    {
      "amount": 1000,
      "created_at": timestamp,
      "user": user
    },
    ...
  ]
}
```

    Type  | Parameter Name | Description 
  --------|---------------:|:------------
   integer| **amount**     | gift amount in cents
  datetime|  **created_at**| timestamp of thank
 [User](User-Information#get-apiv1usersid)|**user**| the user receiving this thank

### GET /api/v1/reports/spending?month=2014-05-01

#### Request

```http
GET /api/v1/reports/spending?month=2014-05-01
Accept: application/json
```

    Type  | Parameter Name | Description 
  --------|---------------:|:------------
   datetime|      **month**| month of logs returns, when omitted, defaults to current month

#### Response

```http
HTTP/1.1 200 OK
Content-Type: application/json

{
  "spending_logs": [
    {
      "amount": 1000,
      "created_at": timestamp,
      "user": user
    },
    ...
  ]
}
```

    Type  | Parameter Name | Description 
  --------|---------------:|:------------
   integer| **amount**     | gift amount in cents
  datetime|  **created_at**| timestamp of thank
 [User](User-Information#get-apiv1usersid)|**user**| the user giving this thank
