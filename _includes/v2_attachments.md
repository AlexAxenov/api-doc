## Attachments
### Upload Attachments

```shell

# "Content-Type: multipart/form-data" - if parameter "file"
# "Content-Type: application/json" - if parameter "file_url"

curl -X POST 'https://api.pact.im/api/p2/attachments/' \
--header 'Content-Type: multipart/form-data' \
--form 'file=@"spec/fixtures/files/1.jpg"' \
--form 'private_api_token=YOUR_API_TOKEN' \
--form 'company_id=COMPANY_ID' \
--form 'metadata[data][width]="1024"' \
--form 'metadata[data][height]="1280"'
```

> The above command returns JSON structured like this:

```json

    "attachment": {
        "id": 53439177,
        "message_id": null,
        "file_name": "1.jpg",
        "mime_type": "image/jpg",
        "size": 812089,
        "attachment_url": "The path to the file",
        "preview_url": "The path to the file",
        "aspect_ratio": 0.8,
        "data": {
            "width": 1024,
            "height": 1280
        }
    }

```

This endpoint creates an attachment which can be sent in message.

#### HTTP Request

`POST https://api.pact.im/api/p2/attachments/`

#### Body Parameters (Json)

Parameter | Required | Validations | Description
--------- | -------- | ----------- | -----------
private_api_token | true | Must be a string | YOUR_API_TOKEN
company_id | true | Must be an integer | ID of the company
file | false | Must be a File. Mutually exclusive with `file_url` | Attachment file
file_url | false | Must be a url (http or https). mutually exclusive with `file` | Attachment file url
metadata | false | Must be an object | An object that can contain parameters: `push_to_talk` and `data`

#### Metadata objects:

Parameter | Required | Validations | Description
--------- | -------- | ----------- | -----------
push_to_talk | false | Boolean | To send audio files as voice messages
data | false | Must be an object | Image only, which may contain parameters: `height` and `width`. Responsible for the height and width of the image.

<aside class="notice">
  You cannot upload more than 5 files per second and more than 30 files per minute per user.
</aside>

#### Response Parameters

<p id="v2-attachment-object">Attachment object</p>

* <b>id</b> (Integer) - ID
* <b>message_id</b> (Integer) - ID of the message
* <b>file_name</b> (String) - Original file name
* <b>mime_type</b> (String) - Mime type (`audio/ogg` for ex.)
* <b>size</b> (Integer) - File size in bytes
* <b>attachment_url</b> (String) - Url of the file
* <b>preview_url</b> (String) - Url of the image preview (if it is image)
* <b>aspect_ratio</b> (Float) - Aspect ratio (if it is image)
* <b>data</b> (Object) - width and height (if it is image)
* <b>push_to_talk</b> (Boolean) - Voice or just audio file (if it is audio)

[Meta object](#v2-meta-object). More info in the paragraph about pagination