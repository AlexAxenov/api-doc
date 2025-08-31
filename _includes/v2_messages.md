## Messages
<p id="messages15"></p>

With the help of what is described in this section you can:
- [Get messages of the conversation](#v2-get-conversation-messages)
- [Get concrete message of the conversation](#v2-get-conversation-message)
- [Send message to existing conversation](#v2-send-conversation-message)
- [Write first message](#v2-write-first-message) (when there is no conversation)


```shell
curl -X GET 'https://api.pact.im/api/p2/conversations/CONVERSATION_ID/messages' \
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
  "messages": [
    {
      "id": 13224,
      "external_id": "b91c9b99-7c24-40a7-8b52-1d80b5b3e158",
      "company_id": 52204,
      "conversation_id": 18642850,
      "contact_id": 549645235,
      "replied_to_id": null,
      "created_at": "2024-11-12T06:28:10.907Z",
      "external_created_at": "2024-11-12T06:28:10.000Z",
      "income": false,
      "status": "read",
      "message": null,
      "reactions": [],
      "details": null,
      "attachments": [
        {
          "id": 53431944,
          "message_id": 13224,
          "file_name": "p4ct-br0ws3r-v01ce-r3c0rd.ogg",
          "mime_type": "audio/ogg",
          "size": 39185,
          "attachment_url": "https://cdn.pact.im/uploads/storage/attachment/file/a1dd41f80c3ae85beb355a38ea3f5b53.ogg",
          "push_to_talk": true
        }
      ]
    }
  ],
  "meta": {
    "page": 1,
    "entries_count": 1,
    "per_page": 150
  }
}
```

<p id="v2-get-conversation-messages"></p>
### Get Conversation Messages

{% assign MESSAGES_PER_PAGE_DEFAULT = 150 %}

Returns paginated messages of the conversation sorted by `external_created_at` field

By default, {{ MESSAGES_PER_PAGE_DEFAULT }} messages will be returned per page

Read more about [pagination](#pagination)

#### HTTP Request

`GET https://api.pact.im/api/p2/conversations/<CONVERSATION_ID>/messages`

#### URL Parameters

Parameter | Description
--------- | -----------
CONVERSATION_ID | ID of the conversation

#### Query Parameters

Parameter | Required | Validations | Description
--------- | -------- | ----------- | -----------
private_api_token | true | Must be a string | YOUR_API_TOKEN
company_id | true | Must be an integer | ID of the company
page | false | Must be an integer | Number of page. Returns first page if it is not provided
per_page | false | Must be an integer | Amount of entries per page will be return ({{ MESSAGES_PER_PAGE_DEFAULT }} by default)

#### Response Parameters

<p id="v2-message-object">Message object</p>

* <b id="v2-message-id">id</b> (Integer) - ID
* <b id="v2-message-external-id">external_id</b> (String) - External message ID from provider (it uses for message replies)
* <b>company_id</b> (Integer) - ID of the company
* <b>conversation_id</b> (Integer) - [ID](#v2-conversation-id) of the conversation
* <b>contact_id</b> (Integer) - ID of the message contact
* <b>replied_to_id</b> (String) - External ID of the message to which this message is a reply
* <b>created_at</b> (Time) - Time we created this message in our db
* <b id="v2-message-external-created-at">external_created_at</b> (Time) - Time from provider (as a rule, the time of direct sending of the message)
* <b>income</b> (Boolean) – Whether message is income or outgoing
* <b>status</b> (String) - Status of the message (can be `created`, `sent`, `delivered`, `read`, `error`)
* <b>message</b> (String) – Message body
* <b>reactions</b> (Array) – Message reactions
* <b>details</b> (Object) - Data containing reason why message was not delivered (if it is)  
* <b>attachments</b> (Array) – Array of message [attachment objects](#v2-attachment-object) (if it has)
* <b>delivery</b> (Boolean) - Indicates whether this message was sent using the bulk mail feature or not.



```shell
curl -X GET 'https://api.pact.im/api/p2/conversations/CONVERSATION_ID/messages/MESSAGE_ID' \
--header 'Content-Type: application/json' \
--data '{
    "private_api_token": YOUR_API_TOKEN,
    "company_id": COMPANY_ID
  }'
```

> The above command returns JSON structured like this:

```json
{
  "message": {
    "id": 1134326991,
    "external_id": "34577",
    "company_id": 86605,
    "conversation_id": 209752626,
    "contact_id": 1583160940,
    "replied_to_id": null,
    "created_at": "2025-02-05T09:01:48.514Z",
    "external_created_at": "2025-02-05T09:01:47.000Z",
    "income": true,
    "status": "created",
    "message": "",
    "reactions": [],
    "details": null,
    "attachments": []
  }
}
```

<p id="v2-get-conversation-message"></p>
### Get Conversation Message

Returns message of the conversation by id

#### HTTP Request

`GET https://api.pact.im/api/p2/conversations/<CONVERSATION_ID>/messages/<MESSAGE_ID>`

#### URL Parameters

Parameter | Description
--------- | -----------
CONVERSATION_ID | ID of the conversation

#### Query Parameters

Parameter | Required | Validations | Description
--------- | -------- | ----------- | -----------
private_api_token | true | Must be a string | YOUR_API_TOKEN
company_id | true | Must be an integer | ID of the company

#### Response Parameters

[Message object](#v2-message-object)


```shell
curl -X POST 'https://api.pact.im/api/p2/conversations/CONVERSATION_ID/messages' \
--header 'Content-Type: application/json' \
--data '{
    "private_api_token": YOUR_API_TOKEN,
    "company_id": COMPANY_ID,
    "text": "test"
  }'
```

> The above command returns JSON structured like this:

```json
{
  "message": {
    "id": 239,
    "external_id": null,
    "company_id": 52204,
    "conversation_id": 18642824,
    "contact_id": 3,
    "replied_to_id": null,
    "created_at": "2025-02-13T14:07:51.582Z",
    "external_created_at": "2025-02-13T14:07:51.000Z",
    "income": false,
    "status": "sent",
    "message": "Hello World!",
    "reactions": [],
    "details": null,
    "attachments": []
  }
}
```

<p id="v2-send-conversation-message"></p>
### Send Message To Existing Conversation

Allows to send message to existing conversation

#### HTTP Request

`POST https://api.pact.im/api/p2/conversations/<CONVERSATION_ID>/messages`

#### URL Parameters

Parameter | Description
--------- | -----------
CONVERSATION_ID | ID of the conversation

#### Body Parameters (Json)

Parameter | Required | Validations | Description
--------- | -------- | ----------- | -----------
private_api_token | true | Must be a string | YOUR_API_TOKEN
company_id | true | Must be an integer | ID of the company
text | false | Must be a string | Text of the message
attachment_ids | false | Must be an array of integers | IDs of the [attachments](#attachments)
replied_to_id | false | Must be a string | [External ID](#v2-message-external-id) of the message to which this message is a reply

#### Response Parameters

[Message object](#v2-message-object)


```shell
curl -X POST 'https://api.pact.im/api/p2/messages' \
--header 'Content-Type: application/json' \
--data '{
    "private_api_token": YOUR_API_TOKEN,
    "company_id": COMPANY_ID,
    "text": "test"
  }'
```

> The above command returns JSON structured like this:

```json
{
  "message": {
    "id": 239,
    "external_id": null,
    "company_id": 52204,
    "conversation_id": 18642824,
    "contact_id": 3,
    "replied_to_id": null,
    "created_at": "2025-02-13T14:07:51.582Z",
    "external_created_at": "2025-02-13T14:07:51.000Z",
    "income": false,
    "status": "sent",
    "message": null,
    "reactions": [],
    "details": null,
    "attachments": [
      {
        "id": 5,
        "message_id": 239,
        "file_name": "5287346531311154701.png",
        "mime_type": "image/jpeg",
        "size": 65030,
        "attachment_url": "https://cdn.pact.im/uploads/storage/attachment/file/a845515c570e285e2ae22d9d493e3abc.png",
        "preview_url": "https://cdn.pact.im/uploads/storage/attachment/file/small-3a46073e438fa82c6c04fd2ff3e1cfef.png",
        "aspect_ratio": 0.46,
        "data": {
          "width": 591,
          "height": 1280
        }
      }
    ]
  }
}
```

<p id="v2-write-first-message"></p>
### Write First Message

{% assign WRITE_FIRST_PROVIDERS = "whatsapp,telegram_personal,whatsapp_business,vkontakte_direct" | split: "," %}

Allows to send message when no conversation with this recipient exists

Only these providers available at this moment: <b>{{ WRITE_FIRST_PROVIDERS | join: ", " }}</b>

#### HTTP Request

`POST https://api.pact.im/api/p2/messages`


#### Body Parameters (Json)

Parameter | Required | Validations | Description
--------- | -------- | ----------- | -----------
private_api_token | true | Must be a string | YOUR_API_TOKEN
company_id | true | Must be an integer | ID of the company
provider | true | Must be a string and one of: {{ WRITE_FIRST_PROVIDERS | join: ", " }} | Provider
phone | false | Must be a string | Recipient phone
nickname | false | Must be a string | Recipient nickname (for telegram_personal)
vkontakte_id  | false | Must be a string | Recipient id vkontakte (Mutually exclusive with `vkontakte_domain`)
vkontakte_domain  | false | Must be a string | Recipient domain vkontakte (for Mutually exclusive with `vkontakte_id`)
text | false | Must be a string | Text of the message
attachment_ids | false | Must be an array of integers | IDs of the [attachments](#attachments)
waba_id | false | Must be a string | WhatsappBusiness template ID
substitutions | false | Must be an array of strings | WhatsappBusiness template substitutions (if template has them)

You should use waba_id if you want to write first with <b>whatsapp_business</b> provider.
More about [waba templates](#v2-waba_templates)

#### Response Parameters

[Message object](#v2-message-object)
