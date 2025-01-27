## Conversations

With the help of what is described in this section you can:
- Get a list of messages from a specific conversion.
- Write first to a new contact.

### Get Messages By Conversation

Returns paginated messages of the conversation sorted by `external_created_at` field.

Messages per page: 150.

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
      "message": "Hello World!",
      "reactions": [],
      "details": null,
      "attachments": [
        {
          "id": 53431944,
          "message_id": 13224,
          "file_name": "p4ct-br0ws3r-v01ce-r3c0rd.ogg",
          "mime_type": "audio/ogg",
          "attachment_url": "https://cdn.pact.im/uploads/storage/attachment/file/a1dd41f80c3ae85beb355a38ea3f5b53.ogg",
          "preview_url": null,
          "size": 39185,
          "aspect_ratio": null
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

#### HTTP Request

`GET https://api.pact.im/api/p2/conversations/<CONVERSATION_ID>/messages`

#### URL Parameters

Parameter | Description
--------- | -----------
CONVERSATION_ID | ID of the conversation

#### Body Parameters (Json)

Parameter | Required | Validations | Description
--------- | -------- | ----------- | -----------
company_id | true | Must be an integer | ID of the company
page | false | Must be an integer | Number of page. Returns last page if it is not provided

Message fields:

* id (Integer)
* external_id (String) - External message ID (it uses for message replies)
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
* details (Hash) - Data containing reason why message was not delivered (if it is)  
* attachments (Array) – Message attachments (if it has)

Attachment fields:

* id (Integer)
* message_id (Integer) - ID of the message
* file_name (String) - Original file name
* mime_type (String) - Mime type ("audio/ogg" for ex.)
* attachment_url (String) - Url of the file
* preview_url (String) - Url of the image preview (if it is image)
* size (Integer) - File size in bytes
* aspect_ratio (Float) - Aspect ratio (if it is image)

Meta fields:

* page (Integer) - Number of current page
* entries_count (Integer) - Number of returned entries (it is the last page if it is less than per_page value)
* per_page (Integer) - Entries per page
