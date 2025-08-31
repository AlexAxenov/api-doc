## Waba Templates
<p id="v2-waba_templates"></p>
With the help of what is described in this section you can:
- [Get waba templates of user's companies](#v2-get-waba_templates)


```shell
curl -X GET 'https://api.pact.im/api/p2/waba_templates' \
--header 'Content-Type: application/json' \
--data '{
    "private_api_token": YOUR_API_TOKEN,
    "company_ids": [<COMPANY_ID>],
    "sort": {"position": "asc"},
    "per_page": 50
  }'
```

> The above command returns JSON structured like this:

{% raw %}
```json
{
  "waba_templates": [
    {
      "id": 1,
      "name": "fuga",
      "body": "Temporibus et rerum optio.",
      "waba_id": "cjw8av3d2l",
      "substitutions_count": 0,
      "header_content_type": null,
      "company_id": 52204,
      "header": null,
      "namespace": null,
      "created_at": "2025-05-21T00:29:29.313Z",
      "position": 1
    },
    {
      "id": 2,
      "name": "with_params",
      "body": "Привет, {{1}}. Это тест параметров. {{2}} - тест второго параметра.",
      "waba_id": "with_params",
      "substitutions_count": 2,
      "header_content_type": null,
      "company_id": 52204,
      "header": null,
      "namespace": "ab06e962_230a_4e22_a3e2_a17bb8951856",
      "created_at": "2025-05-21T02:13:08.232Z",
      "position": 2
    }
  ],
  "meta": {
    "page": 1,
    "entries_count": 2,
    "per_page": 25
  }
}
```
{% endraw %}

<p id="v2-get-waba_templates"></p>
### Get Waba Templates

{% assign WABA_TEMPLATES_PER_PAGE_DEFAULT = 25 %}

Returns paginated waba templates of user's companies sorted by `created_at: desc` field by default.
You can specify sort param. You can specify companies

By default, {{ WABA_TEMPLATES_PER_PAGE_DEFAULT }} waba templates will be returned per page

Read more about [pagination](#pagination)

#### HTTP Request

`GET https://api.pact.im/api/p2/waba_templates`

#### Query Parameters

Parameter | Required | Validations | Description
--------- | -------- | ----------- | -----------
private_api_token | true | Must be a string | YOUR_API_TOKEN
company_ids | false | Must be an array of integers | IDs of the companies. You will get waba templates for all companies if not specified
sort | false | Must be an object | You can sort by `created_at` or `position` fields, by desc or asc orders. Example: `{"position": "asc"}`. Sorted by `created_at: desc` if not specified.
page | false | Must be an integer | Number of page. Returns first page if it is not provided
per_page | false | Must be an integer | Amount of entries per page will be return ({{ WABA_TEMPLATES_PER_PAGE_DEFAULT }} by default)

#### Response Parameters

<p id="v2-waba_template-object">Waba template object</p>

* <b>id</b> (Integer) - ID
* <b>name</b> (String) - Waba template name
* <b>body</b> (String) - Template text
* <b>waba_id</b> (String) - ID of the Waba template on the WhatsappBusiness side
* <b>substitutions_count</b> (Integer) - Count of substitutions
* <b>header_content_type</b> (String) - Type of header content ["video", "document", "text", "image"]
* <b>company_id</b> (Integer) - ID of the company
* <b>header</b> (String) - Header text
* <b>namespace</b> (String) - Namespace
* <b>created_at</b> (Time) - Template create time
* <b>position</b> (Integer) - Position of template in company

[Meta object](#v2-meta-object). More info in the paragraph about pagination
