## Conversations

With the help of what is described in this section you can:
- [Get conversations of the company](#v2-get-conversations)
- [Get concrete conversation of the company](#v2-get-conversation)

```shell
curl -X GET 'https://api.pact.im/api/p2/conversations' \
--header 'Content-Type: application/json' \
--data '{
    "private_api_token": YOUR_API_TOKEN,
    "company_id": COMPANY_ID,
    "page": 1
  }'
```

> The above command returns JSON structured like this:

```json
{
  "conversations": [
    {
      "id": 18642847,
      "company_id": 52204,
      "sender_name": "79517591813",
      "sender_phone": "79517591813",
      "sender_external_id": "79517591813",
      "sender_external_public_id": "79517591813",
      "provider": "whatsapp",
      "avatar_url": "http://localhost:3000/avatars/original/missing.png",
      "created_at": "2024-11-11T12:35:57.995Z",
      "last_updated_at": "2024-11-21T08:37:36.000Z",
      "last_message_id": 14056,
      "operational_state": "open",
      "replied_state": "replied",
      "group": false
    }
  ],
  "meta": {
    "page": 1,
    "entries_count": 2,
    "per_page": 25
  }
}
```

<p id="v2-get-conversations"></p>
### Get Conversations

{% assign CONVERSATIONS_PER_PAGE_DEFAULT = 25 %}

Returns paginated conversations of the company sorted by `last_updated_at` field

By default, {{ CONVERSATIONS_PER_PAGE_DEFAULT }} conversations will be returned per page

Read more about [pagination](#pagination)

#### HTTP Request

`GET https://api.pact.im/api/p2/conversations`

#### Query Parameters

Parameter | Required | Validations | Description
--------- | -------- | ----------- | -----------
private_api_token | true | Must be a string | YOUR_API_TOKEN
company_id | true | Must be an integer | ID of the company
page | false | Must be an integer | Number of page. Returns first page if it is not provided
per_page | false | Must be an integer | Amount of entries per page will be return ({{ CONVERSATIONS_PER_PAGE_DEFAULT }} by default)

#### Response Parameters

<p id="v2-conversation-object">Conversation object</p>

* <b id="v2-conversation-id">id</b> (Integer) - ID
* <b>company_id</b> (Integer) - ID of the company
* <b>sender_name</b> (String) - Sender or chat (if it's group) name
* <b>sender_phone</b> (String) - Sender phone (if provider has phones)
* <b>sender_external_id</b> (String) - External ID of the conversation
* <b>sender_external_public_id</b> (String) - Public External ID of the conversation
* <b>provider</b> (String) - Provider
* <b>avatar_url</b> (String) - Sender or chat (if it's group) avatar url
* <b>created_at</b> (Time) - Time we created this conversation in our db
* <b>last_updated_at</b> (Time) - [External created at](#v2-message-external-created-at) of the last message in this conversation (null if no messages yet)
* <b>last_message_id</b> (Integer) - [ID](#v2-message-id) of the last message (null if no messages yet)
* <b>operational_state</b> (String) - (can be `open`, `archived`, `blocked`)
* <b>replied_state</b> (String) - (can be `initialized`, `replied`, `unreplied`)
* <b>group</b> (Boolean) – Group conversation or not

[Meta object](#v2-meta-object). More info in the paragraph about pagination


```shell
curl -X GET 'https://api.pact.im/api/p2/conversations/CONVERSATION_ID' \
--header 'Content-Type: application/json' \
--data '{
    "private_api_token": YOUR_API_TOKEN,
    "company_id": COMPANY_ID
  }'
```

> The above command returns JSON structured like this:

```json
{
  "conversation": {
    "id": 18642847,
    "company_id": 52204,
    "sender_name": "79517591813",
    "sender_phone": "79517591813",
    "sender_external_id": "79517591813",
    "sender_external_public_id": "79517591813",
    "provider": "whatsapp",
    "avatar_url": "http://localhost:3000/avatars/original/missing.png",
    "created_at": "2024-11-11T12:35:57.995Z",
    "last_updated_at": "2024-11-21T08:37:36.000Z",
    "last_message_id": 14056,
    "operational_state": "open",
    "replied_state": "replied",
    "group": false
  }
}
```

<p id="v2-get-conversation"></p>
### Get Conversation Details

Returns conversation of the company by id

#### HTTP Request

`GET https://api.pact.im/api/p2/conversations/<CONVERSATION_ID>`

#### URL Parameters

Parameter | Description
--------- | -----------
CONVERSATION_ID | ID of the conversation

#### Query Parameters

Parameter | Required | Validations | Description
--------- | -------- | ----------- | -----------
private_api_token | true | Must be a string | YOUR_API_TOKEN
company_id | true | Must be an integer | ID of the company

<p id="v2-update-conversation"></p>
### Update Conversation
```shell
curl -X PUT 'https://api.pact.im/api/p2/conversations/3' \
--header 'Content-Type: application/json' \
--data '{
  "private_api_token":   "43384f0bc343f295f3172ab1b312fc9a09b212f14778cfaf5e22",
  "company_id": 1,
  "operational_state": "archived", 
  "replied_state": "unreplied"
}'
```

> The above command returns JSON structured like this:

```json
{
    "conversation": {
        "id": 3,
        "company_id": 1,
        "sender_name": "Иван",
        "sender_phone": null,
        "sender_external_id": "110218431333189",
        "sender_external_public_id": "test",
        "provider": "telegram_personal",
        "avatar_url": "http://localhost:3000/avatars/original/missing.png",
        "created_at": "2025-12-11T15:14:17.879Z",
        "last_updated_at": "2025-12-15T10:52:40.000Z",
        "last_message_id": 1123356,
        "operational_state": "archived",
        "replied_state": "unreplied",
        "group": false
    }
}
```

This request allows you to update the conversation status - answered/unanswered and/or send the conversation to the archive or retrieve it.

#### HTTP Request

`PUT https://api.pact.im/api/p2/conversations/<CONVERSATION_ID>`

#### URL Parameters

Parameter | Description
--------- | -----------
CONVERSATION_ID | ID of the conversation

#### Query Parameters

Parameter | Required | Validations | Description
--------- | -------- | ----------- | -----------
private_api_token | true | Must be a string | YOUR_API_TOKEN
company_id | true | Must be an integer | ID of the company
operational_state | false | Must be a string | Can be `open` or `archived`. 
replied_state | false | Must be a string| Can be `replied` or `unreplied`. 

#### Response Parameters

[Conversation object](#v2-conversation-object)



