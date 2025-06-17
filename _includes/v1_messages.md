## Messages

<aside class="notice">
  Currently we are migrating to API V2. Use <a href="#messages15">this</a> message methods instead.
</aside>

### Upload attachments

```shell
curl -X POST "https://api.pact.im/p1/companies/COMPANY_ID/conversations/CONVERSATION_ID/messages/attachments"
  -H "X-Private-Api-Token: YOUR_API_TOKEN"
  -F "file=@path/to/local/file"
```

```php
<?php

$file_path = realpath('image.png');
$response_attach_1 = $client->attachments->uploadAttachment($company, $conversation, $file_path);

$file_url = 'https://en.wikipedia.org/wiki/Altai_Republic#/media/File:Katun.jpg';
$response_attach_2 = $client->attachments->uploadAttachment($company, $conversation, $file_url);

$messages = $client->messages->sendMessage(
  $company,
  $conversation,
  $msg,
  [
    $response_attach_1->data->external_id,
    $response_attach_2->data->external_id
  ]
);
```

> The above command returns JSON structured like this:

```json
{
   "status":"ok",
   "data":{
      "external_id":1
   }
}
```

This endpoint creates an attachment which can be sent in message.

#### HTTP Request

`POST https://api.pact.im/p1/companies/<COMPANY_ID>/conversations/<CONVERSATION_ID>/messages/attachments`

#### URL Parameters

Parameter | Description
--------- | -----------
COMPANY_ID | ID of the company
CONVERSATION_ID | ID of the conversation

#### Query Parameters

Parameter | Required | Validations | Description
--------- | -------- | ----------- | -----------
file | false | Must be a File. Mutually exclusive with `file_url` | Attachment file
file_url | false | Must be a url (http or https). mutually exclusive with `file` | Attachment file url

<aside class="notice">
You can use only one parameter: 'file' or 'file_url'. You can`t use both parameters together.
</aside>
