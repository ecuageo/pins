  Prefix | Verb   | URI Pattern             | Controller#Action
 --------|--------|-------------------------|------------------
  access | POST   | /access(.:format)       | access#create
profiles | POST   | /profiles(.:format)     | profiles#create
 profile | GET    | /profiles/:id(.:format) | profiles#show
         | PATCH  | /profiles/:id(.:format) | profiles#update
         | PUT    | /profiles/:id(.:format) | profiles#update
         | DELETE | /profiles/:id(.:format) | profiles#destroy
    user | POST   | /users(.:format)         | user#create
         | GET    | /users(.:format)         | user#show
         | PATCH  | /users(.:format)         | user#update
         | PUT    | /users(.:format)         | user#update

### POST /users

#### Request

```http
POST /users HTTP/1.1
Accept: application/json

{
  "user":
  {
    "email": "angry_bowler@gmail.com",
    "password": "[FILTERED]", 
    "password_confirmation": "[FILTERED]"
  }
}
```

#### Response

```http
HTTP/1.1 201 Created
Content-Type: application/json

{
  "id":4,
  "email": "angry_bowler@gmail.com",
  "created_at":"2015-09-25T21:54:31.509Z",
  "updated_at":"2015-09-25T21:54:31.509Z"
}
```

    Type  | Parameter Name | Description 
  --------|---------------:|:------------
 integer |**id**| Account id
 integer |**email**| Account email
 datetime|**created_at**| When the account was created
 datetime|**updated_at**| When the account was updated


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
  "name": "Mom",
  "user_id": 16,
  "created_at":"2015-09-25T21:54:31.509Z",
  "updated_at":"2015-09-25T21:54:31.509Z"
}
```

    Type  | Parameter Name | Description 
  --------|---------------:|:------------
 integer |**id**| Profile id
 string |**name**| Profile name
 integer |**user_id**| Account id
 datetime|**created_at**| When the profile was created
 datetime|**updated_at**| When the profile was updated

