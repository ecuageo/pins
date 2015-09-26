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
