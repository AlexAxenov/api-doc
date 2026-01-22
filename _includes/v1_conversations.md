## Conversations

Conversation represents dialogue between you and the client. Currently only 1-1 conversations are supported.
Each conversation has many messages.

### Update note for conversation

```shell
curl -X PUT "https://api.pact.im/p1/companies/COMPANY_ID/conversations/<ID>/note"
  -H "X-Private-Api-Token: YOUR_API_TOKEN"
  -d "note=your+note"
```

> The above command returns JSON structured like this:
z
```json
{
   "status":"updated"
}
```

This endpoint update note of conversation in the company.

#### HTTP Request

`PUT https://api.pact.im/p1/companies/<COMPANY_ID>/conversations/<ID>/note`

#### URL Parameters

Parameter | Description
--------- | -----------
COMPANY_ID | ID of the company
CONVERSATION_ID | ID of the conversation

#### Body Parameters

Parameter | Required | Validations | Description
--------- | -------- | ----------- | -----------
note | true | Must be String | Note text

### Update assignee for conversation

```shell
curl -X PUT "https://api.pact.im/p1/companies/COMPANY_ID/conversations/<ID>/assign"
  -H "X-Private-Api-Token: YOUR_API_TOKEN"
  -d "assignee_id=42"
```

```php
<?php

/**
 * Update assignee for conversation
 * This endpoint update assignee of conversation in the company using whatsapp channel
 * @link https://pact-im.github.io/api-doc/#update-assignee-for-conversation
 *
 * @param int id of company
 * @param int id of conversation
 * @param int id of user
 * @return Json|null
 */

$client->conversations->updateAssignee(
  $companyId,
  $conversationId,
  $assigneeId
);
```

> The above command returns JSON structured like this:

```json
{
   "status":"ok",
   "data":{
      "conversation":{
         "external_id":1,
      }
   }
}
```

This endpoint update assignee the pact user to the conversation in the company.

#### HTTP Request

`PUT https://api.pact.im/p1/companies/<COMPANY_ID>/conversations/<ID>/assign`

#### URL Parameters

Parameter | Description
--------- | -----------
COMPANY_ID | ID of the company
ID | ID of the conversation

#### Query Parameters

Parameter | Required | Validations | Description
--------- | -------- | ----------- | -----------
assignee_id | false | Must be an integer | User id

### Toggle bitrix block openlines

```shell
curl -X PUT "https://api.pact.im/p1/companies/COMPANY_ID/conversations/<ID>/toggle_bitrix_block_openlines"
  -H "X-Private-Api-Token: YOUR_API_TOKEN"
  -d "enabled=true"
```
> The above command returns JSON structured like this:

```json
{
  "status": "ok",
  "data": {
    "conversation": {
      "external_id": 91,
      "name": "Mikhail Tabunov",
      "channel_id": null,
      "channel_type": "whatsapp",
      "created_at": "2021-12-09T06:08:50.106Z",
      "created_at_timestamp": 1639030130,
      "avatar": "https://api.pact.im/avatars/original/missing.png",
      "sender_external_id": "79770000011",
      "meta": {},
      "last_message_at": 1639030130,
      "last_income_message_at": 0,
      "bitrix_block_openlines": true
    }
  }
}
```

This endpoint toggle bitrix_block_openlines param to the conversation in the company.

#### HTTP Request

`PUT https://api.pact.im/p1/companies/<COMPANY_ID>/conversations/<ID>/toggle_bitrix_block_openlines`

#### URL Parameters

Parameter | Description
--------- | -----------
COMPANY_ID | ID of the company
ID | ID of the conversation

#### Query Parameters

Parameter | Required | Validations | Description
--------- | -------- | ----------- | -----------
enabled | false | Must be a boolean | Enabled status
