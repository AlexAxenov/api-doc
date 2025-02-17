## Webhooks

> Webhook when message was sent:

```json
{
  "event": "create",
  "type": "message",
  "object": {
    "id": 22891,
    "external_id": null,
    "company_id": 52249,
    "conversation_id": 18643195,
    "contact_id": 549645443,
    "replied_to_id": null,
    "created_at": "2025-02-17T14:46:29.074Z",
    "external_created_at": "2025-02-17T14:46:29.000Z",
    "income": false,
    "status": "sent",
    "message": "Текст в заголовке\nШаблон с кнопками и текстом в заголовке",
    "reactions": [],
    "details": null,
    "attachments": []
  }
}
```

> Webhook when message was delivered:

```json
{
  "event": "update",
  "type": "message",
  "object": {
    "id": 22891,
    "external_id": "wamid.HBgLNzk1MTY1ODE2MTIVAgARGBI3NzUyM0MxNkYxRjFGM0U0NkMA",
    "company_id": 52249,
    "conversation_id": 18643195,
    "contact_id": 549645443,
    "replied_to_id": null,
    "created_at": "2025-02-17T14:46:29.074Z",
    "external_created_at": "2025-02-17T14:46:29.000Z",
    "income": false,
    "status": "delivered",
    "message": "Текст в заголовке\nШаблон с кнопками и текстом в заголовке",
    "reactions": [],
    "details": null,
    "attachments": []
  }
}
```

> Webhook when message was failed:

```json
{
  "event": "update",
  "type": "message",
  "object": {
    "id": 22892,
    "external_id": "wamid.HBgLNzk2MDk4MjMwODkVAgARGBJCMjM1NEU1Q0UwMzcyNEI2NEUA",
    "company_id": 52249,
    "conversation_id": 18643298,
    "contact_id": 549645443,
    "replied_to_id": null,
    "created_at": "2025-02-17T15:07:24.968Z",
    "external_created_at": "2025-02-17T15:07:24.000Z",
    "income": false,
    "status": "error",
    "message": "Текст в заголовке\nШаблон с кнопками и текстом в заголовке",
    "reactions": [],
    "details": {
      "result": "NOT DELIVERED",
      "internal_reason": {
        "errors": [
          {
            "code": 131026,
            "error_data": {
              "details": "Message Undeliverable."
            },
            "message": "Message undeliverable",
            "title": "Message undeliverable"
          }
        ]
      }
    },
    "attachments": []
  }
}
```

With Api V2 release we are starting to send new type of webhooks. More standardized, opimized and informative

#### Webhook Parameters

* <b>event</b> (String) - Type of the event (create, update, delete)
* <b>type</b> (String) - Object type (message, conversation, ...)
* <b>object</b> (Object) - Object with its fields

### Message Webhooks:

When a message is sent (after [sending message to existing conversation](#v2-send-conversation-message) for ex), the service triggers a webhook with the create event and the status `sent`.
At this stage, `external_id` is null because we have not received answer from provider at this moment

Once the message is successfully sent, a webhook with the update event is triggered, where:

The status is updated to `delivered`, `external_id` is assigned

If a message fails to send, the status is updated to `error`, and the `details` field contains the reason for the failure.
In this case, the message failed to send due to recipient does not have whatsapp_business

For incoming messages you will receive only one webhook with event `create` and message status `created`

#### Webhook Message Object Parameters

[Message object](#v2-message-object)
