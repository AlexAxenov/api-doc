## Company Webhooks

With the help of what is described in this section you can:
- [Get webhooks of the company](#v2-get-company-webhooks)
- [Create webhook](#v2-create-company-webhook)
- [Update webhook](#v2-update-company-webhook)
- [Delete webhook](#v2-delete-company-webhook)

```shell
curl -X GET 'https://api.pact.im/api/p2/companies/COMPANY_ID/webhooks' \
--header 'Content-Type: application/json' \
--data '{
    "private_api_token": YOUR_API_TOKEN
  }'
```

> The above command returns JSON structured like this:

```json
{
  "webhooks": [
    {
      "id": 1,
      "url": "https://example.com/webhook",
      "active": true
    }
  ],
  "meta": {
    "page": 1,
    "entries_count": 1,
    "per_page": 25
  }
}
```

<p id="v2-get-company-webhooks"></p>
### Get Company Webhooks

Returns paginated list of webhooks of the company

Read more about [pagination](#pagination)

#### HTTP Request

`GET https://api.pact.im/api/p2/companies/<COMPANY_ID>/webhooks`

#### URL Parameters

Parameter | Description
--------- | -----------
COMPANY_ID | ID of the company

#### Query Parameters

Parameter | Required | Validations | Description
--------- | -------- | ----------- | -----------
private_api_token | true | Must be a string | YOUR_API_TOKEN

#### Response Parameters

<p id="v2-company-webhook-object">Webhook object</p>

* <b id="v2-company-webhook-id">id</b> (Integer) - ID
* <b>url</b> (String) - Webhook URL
* <b>active</b> (Boolean) - Whether webhook is active or not

[Meta object](#v2-meta-object). More info in the paragraph about pagination


```shell
curl -X POST 'https://api.pact.im/api/p2/companies/COMPANY_ID/webhooks' \
--header 'Content-Type: application/json' \
--data '{
    "private_api_token": YOUR_API_TOKEN,
    "url": "https://example.com/webhook"
  }'
```

> The above command returns JSON structured like this:

```json
{
  "webhook": {
    "id": 1,
    "url": "https://example.com/webhook",
    "active": false
  }
}
```

<p id="v2-create-company-webhook"></p>
### Create Webhook

Creates a new webhook for the company. Webhook is created inactive by default.

Maximum 5 webhooks per company are allowed.

#### HTTP Request

`POST https://api.pact.im/api/p2/companies/<COMPANY_ID>/webhooks`

#### URL Parameters

Parameter | Description
--------- | -----------
COMPANY_ID | ID of the company

#### Query Parameters

Parameter | Required | Validations | Description
--------- | -------- | ----------- | -----------
private_api_token | true | Must be a string | YOUR_API_TOKEN
url | true | Must be a string | Webhook URL

#### Response Parameters

[Webhook object](#v2-company-webhook-object)


```shell
curl -X PUT 'https://api.pact.im/api/p2/companies/COMPANY_ID/webhooks/WEBHOOK_ID' \
--header 'Content-Type: application/json' \
--data '{
    "private_api_token": YOUR_API_TOKEN,
    "url": "https://example.com/new-webhook",
    "active": true
  }'
```

> The above command returns JSON structured like this:

```json
{
  "webhook": {
    "id": 1,
    "url": "https://example.com/new-webhook",
    "active": true
  }
}
```

<p id="v2-update-company-webhook"></p>
### Update Webhook

Updates an existing webhook of the company

#### HTTP Request

`PUT https://api.pact.im/api/p2/companies/<COMPANY_ID>/webhooks/<WEBHOOK_ID>`

#### URL Parameters

Parameter | Description
--------- | -----------
COMPANY_ID | ID of the company
WEBHOOK_ID | ID of the webhook

#### Query Parameters

Parameter | Required | Validations | Description
--------- | -------- | ----------- | -----------
private_api_token | true | Must be a string | YOUR_API_TOKEN
url | false | Must be a string | Webhook URL
active | false | Must be a boolean | Whether webhook is active or not

#### Response Parameters

[Webhook object](#v2-company-webhook-object)


```shell
curl -X DELETE 'https://api.pact.im/api/p2/companies/COMPANY_ID/webhooks/WEBHOOK_ID' \
--header 'Content-Type: application/json' \
--data '{
    "private_api_token": YOUR_API_TOKEN
  }'
```

> The above command returns JSON structured like this:

```json
{}
```

<p id="v2-delete-company-webhook"></p>
### Delete Webhook

Deletes a webhook of the company

#### HTTP Request

`DELETE https://api.pact.im/api/p2/companies/<COMPANY_ID>/webhooks/<WEBHOOK_ID>`

#### URL Parameters

Parameter | Description
--------- | -----------
COMPANY_ID | ID of the company
WEBHOOK_ID | ID of the webhook

#### Query Parameters

Parameter | Required | Validations | Description
--------- | -------- | ----------- | -----------
private_api_token | true | Must be a string | YOUR_API_TOKEN
