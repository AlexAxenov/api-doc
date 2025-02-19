## Authentication V1

```shell
curl -X POST "https://api.pact.im/api/p2/some_endpoint" \
--header "Content-Type: application/json" \
--data '{
    "private_api_token": "YOUR_API_TOKEN",
    "another_parameter": "value"
  }'
```

> Example of auth error:

```json
{
  "errors": [
    {
      "status": 401,
      "code": "unauthorized",
      "title": "Unauthorized",
      "detail": "No token provided"
    }
  ]
}
```

To facilitate a smooth transition, we have decided to temporarily keep the old authentication method and label it as V1

For V1 authentication, a `private_api_token` will be used as before. This token must be included in the body of all requests
