## Messages

With the help of what is described in this section you can:
- [Get messages of the conversation](#v2-get-conversation-messages)
- [Get concrete message of the conversation](#v2-get-conversation-message)
- [Send message to existing conversation](#v2-send-conversation-message)
- [Write first message (when there is no conversation)](#v2-write-first-message)


<p id="v2-get-conversation-messages"></p>
### Get Conversation Messages

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

Returns paginated messages of the conversation sorted by `external_created_at` field

By default, 150 messages are returned per page

#### HTTP Request

`GET https://api.pact.im/api/p2/conversations/<CONVERSATION_ID>/messages`

#### URL Parameters

Parameter | Description
--------- | -----------
CONVERSATION_ID | ID of the conversation

#### Body Parameters (Json)

Parameter | Required | Validations | Description
--------- | -------- | ----------- | -----------
private_api_token | true | Must be a string | YOUR_API_TOKEN
company_id | true | Must be an integer | ID of the company
page | false | Must be an integer | Number of page. Returns first page if it is not provided. More about [pagination](#pagination)
per_page | false | Must be an integer | Amount of entries per page will be return

#### Response Parameters

<p id="v2-message-object">Message object</p>

* id (Integer)
* external_id (String) - External message ID from provider (it uses for message replies)
* company_id (Integer) - ID of the company
* conversation_id (Integer) - ID of the conversation
* contact_id (Integer) - ID of the message contact
* replied_to_id (String) - External ID of the message to which this message is a reply
* created_at (Time) - Time we created this message in our db
* external_created_at (Time) - Time from provider (as a rule, the time of direct sending of the message)
* income (Boolean) – Whether message is income or outgoing
* status (String) - Status of the message (can be "created", "sent", "delivered", "read", "error")
* message (String) – Message body
* reactions (Array) – Message reactions
* details (Object) - Data containing reason why message was not delivered (if it is)  
* attachments (Array) – Message attachments (if it has)

<p id="v2-attachment-object">Attachment object</p>

* id (Integer)
* message_id (Integer) - ID of the message
* file_name (String) - Original file name
* mime_type (String) - Mime type ("audio/ogg" for ex.)
* size (Integer) - File size in bytes
* attachment_url (String) - Url of the file
* preview_url (String) - Url of the image preview (if it is image)
* aspect_ratio (Float) - Aspect ratio (if it is image)
* data (Object) - width and height (if it is image)
* push_to_talk (Boolean) - Voice or just audio file (if it is audio)

[Meta object](#v2-meta-object) in pagination paragraph


<p id="v2-get-conversation-message"></p>
### Get Conversation Message

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
    "attachments": [
      {
        "id": 5,
        "message_id": 13352,
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

Returns message of the conversation by id

#### HTTP Request

`GET https://api.pact.im/api/p2/conversations/<CONVERSATION_ID>/messages`

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

[Message object](#v2-message-object)

[Attachment object](#v2-attachment-object)


<p id="v2-send-conversation-message"></p>
### Send Message To Existing Conversation

Allows to send message to existing conversation

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
    "status": "created",
    "message": "Hello World!",
    "reactions": [],
    "details": null,
    "attachments": []
  }
}
```

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
attachment_ids | false | Must be an array of integers | IDs of the attchments
replied_to_id | false | Must be a string | External ID of the message to which this message is a reply

#### Response Parameters

[Message object](#v2-message-object)

[Attachment object](#v2-attachment-object)


<p id="v2-write-first-message"></p>
### Write First Message

Allows to send message when no conversation with recipient exists

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
    "status": "created",
    "message": "Hello World!",
    "reactions": [],
    "details": null,
    "attachments": []
  }
}
```

#### HTTP Request

`POST https://api.pact.im/api/p2/messages`

#### URL Parameters

Parameter | Description
--------- | -----------
CONVERSATION_ID | ID of the conversation

#### Body Parameters (Json)

Parameter | Required | Validations | Description
--------- | -------- | ----------- | -----------
private_api_token | true | Must be a string | YOUR_API_TOKEN
company_id | true | Must be an integer | ID of the company
provider | false | Must be a string | Provider
phone | false | Must be a string | Recipient phone
text | false | Must be a string | Text of the message
attachment_ids | false | Must be an array of integers | IDs of the attchments

#### Response Parameters

[Message object](#v2-message-object)

[Attachment object](#v2-attachment-object)
