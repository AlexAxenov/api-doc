## Request Rate Limits

> Error like this will be returned when request limit was overed:

```json
{
  "errors": [
    {
      "status": 429,
      "code": "too_many_requests",
      "title": "Too many requests error",
      "detail": "Please wait for 50 seconds"
    }
  ]
}
```

Api V2 has request rate limits

To ensure system stability, prevent abuse, and optimize performance, our API enforces rate limits.
These limits control the number of requests a single user can make within a specific time frame

Why Are Rate Limits Necessary?
Rate limits help to:
Protect the system from overload – limiting request frequency prevents sudden spikes in server load.
Prevent abuse.
Ensure fair resource distribution – all users get equal access to the API, preventing excessive usage by a single client from affecting others.
Optimize performance – keeps the server running smoothly and predictably without sudden performance drops.
If the rate limit is exceeded, the server will return an error with the HTTP status code 429 Too Many Requests. In such cases, it is recommended to retry the request after some time

Some endpoints have several rate limits to control both short-term and long-term request bursts.
This multi-limit approach balances responsiveness and fairness, allowing high-frequency but controlled API usage

### The rate limits depending on the type of request:

[Get messages of the conversation](#v2-get-conversation-messages):
- Maximum 20 requests per minute

[Get concrete message of the conversation](#v2-get-conversation-message):
- Maximum 20 requests per minute

[Get conversations of the company](#v2-get-conversations):
- Maximum 10 requests per minute

[Get concrete conversation of the company](#v2-get-conversation):
- Maximum 10 requests per minute

[Send message to existing conversation](#v2-send-conversation-message):
- Maximum 5 requests per second
- Maximum 30 requests per minute

[Write first message](#v2-write-first-message):
- Maximum 5 requests per second
- Maximum 30 requests per minute

[Get waba templates](#v2-get-waba_templates):
- Maximum 20 requests per minute
