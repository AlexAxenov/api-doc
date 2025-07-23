## Webhooks

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

> Webhook when connecting a messenger (without pages):

```json
{
  "event": "update",
  "type": "auth",
  "object": {
    "id": 1,
    "company_id": 1,
    "provider": "whatsapp",
    "state": "enabled",
    "phone_number": "79000000000",
    "created_at": "2025-06-25T08:02:01.578Z",
    "updated_at": "2025-06-25T08:02:30.904Z",
    "sync_messages_at": "2025-06-24T08:02:01.570Z"
  }
}
```

### Auth Webhooks:

This webhook is triggered whenever an auth object undergoes a significant change. The following events are supported:

* <b>Created</b> ("event": "create") -  Triggered when a new auth is created.

* <b>Connected</b> ("event": "update", "state": "enabled") -  Triggered when the auth is successfully connected(for example, when WhatsApp is successfully connected)

* <b>Disconnected</b> ( "event": "update", "state": "disabled") - Triggered when the auth is disconnected from the external service.

* <b>Deleted</b> ("event": "delete") - Triggered when the auth is permanently deleted.


#### Webhook Auth Object Parameters

[Auth object](#v2-auth-object)
