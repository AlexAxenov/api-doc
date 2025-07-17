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
    },
    {
      "id": 18642824,
      "company_id": 52204,
      "sender_name": "89045713184 Pact.im",
      "sender_phone": "79045713184",
      "sender_external_id": "355620062",
      "sender_external_public_id": "test_123",
      "provider": "telegram_personal",
      "avatar_url": "http://localhost:3000/avatars/original/missing.png",
      "created_at": "2024-11-07T14:52:55.881Z",
      "last_updated_at": "2024-11-18T09:01:11.000Z",
      "last_message_id": 13828,
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

#### Body Parameters (Json)

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

#### Body Parameters (Json)

Parameter | Required | Validations | Description
--------- | -------- | ----------- | -----------
private_api_token | true | Must be a string | YOUR_API_TOKEN
company_id | true | Must be an integer | ID of the company

#### Response Parameters

[Conversation object](#v2-conversation-object)
