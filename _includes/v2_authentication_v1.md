## Authentication V1

```shell
curl -X POST "https://api.pact.im/api/p2/some_endpoint" \
--header "Content-Type: application/json" \
--data '{
    "private_api_token": "YOUR_API_TOKEN",
    "another_parameter": "value"
  }'
```

```shell
curl -X POST "https://api.pact.im/api/p2/some_endpoint" \
--header "Content-Type: application/json" \
--header 'X-Private-Api-Token: YOUR_API_TOKEN' \
--data '{
    "another_parameter": "value"
  }'
```

```shell
curl -X POST "https://api.pact.im/api/p2/some_endpoint?private_api_token=<YOUR_API_TOKEN>" \
--header "Content-Type: application/json" \
--data '{
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

For V1 authentication, a private api token will be used as before. Use it for all requests. You can use one of these variants you like:
- pass `private_api_token` param in json payload
- pass `X-Private-Api-Token` param in headers
- pass `private_api_token` as url param

See examples on the right side -->