## Pagination

> Example of response with pagination:

```json
{
  "companies": [
    {
      "id": 26,
      "name": "Company 26"
    },
    {
      "id": 27,
      "name": "Company 27"
    },
    {
      "id": 28,
      "name": "Company 28"
    },
    {
      "id": 29,
      "name": "Company 29"
    }
  ],
  "meta": {
    "page": 2,
    "entries_count": 4,
    "per_page": 25
  }
}
```

Api V2 supports pagination. Pagination is a method used to divide large sets of data into smaller, more manageable chunks, which are returned page by page. This helps improve performance and reduces the amount of data transferred in a single request

If there are more results than can fit on a single page, you can request additional pages by increasing the page parameter. The response will include metadata indicating the current page, the number of records on that page, and the total number of records per page

For example, if there are 100 records and per_page is set to 25, there will be 4 pages available. You can navigate through the pages by changing the page parameter in your request

#### Pagination Parameters In Request

Parameter | Required | Validations | Description
--------- | -------- | ----------- | -----------
page | false | Must be an integer | Number of page. Returns first page if it is not provided
per_page | false | Must be an integer | Amount of entries per page will be return

#### Response Parameters

<p id="v2-meta-object">Meta object</p>

* <b>page</b> (Integer) - Number of current page
* <b>entries_count</b> (Integer) - Number of returned entries
* <b>per_page</b> (Integer) - Entries per page

<aside class="notice">
  If the value of entries_count less than per_page, then the page is last one and there are no more entries
</aside>
