## Webhooks

> Webhook when creating a message:

```json
{
  "event": "create",
  "type": "message",
  "object": {
    "id": 123,
    "external_id": "msg_123456",
    "company_id": 1,
    "conversation_id": 456,
    "contact_id": 789,
    "replied_to_id": null,
    "created_at": "2024-01-15T10:30:00Z",
    "external_created_at": "2024-01-15T10:30:00Z",
    "income": true,
    "status": "delivered",
    "message": "Hello, this is a test message",
    "reactions": null,
    "details": null,
    "delivery": null,
    "deleted": false,
    "contact": {
      "id": 789,
      "external_id": "123",
      "external_public_id": "+79001234567",
      "name": "John Doe",
      "avatar_url": "https://example.com/avatars/user.jpg",
      "phone": "+79001234567"
    },
  "conversation": {
    "id": 456,
    "company_id": 1,
    "sender_name": "John Doe",
    "sender_phone": "+79001234567",
    "sender_external_id": "123456789",
    "sender_external_public_id": "+79001234567",
    "provider": "whatsapp",
    "avatar_url": "https://example.com/avatars/user.jpg",
    "created_at": "2024-01-15T09:00:00Z",
    "last_updated_at": "2024-01-15T10:30:00Z",
    "last_message_id": 123,
    "operational_state": "active",
    "replied_state": "replied",
    "group": false
  },
  "attachments": [
      {
        "id": 101,
        "message_id": 123,
        "file_name": "image.jpg",
        "mime_type": "image/jpeg",
        "size": 102400,
        "attachment_url": "https://cdn.example.com/attachments/image.jpg",
        "preview_url": "https://cdn.example.com/attachments/small/image.jpg",
        "aspect_ratio": 1.5
      }
    ]
  }
}
```

With Api V2 release we are starting to send new type of webhooks. More standardized, opimized and informative

Webhook could be repeated up to 5 times within 60 sec delay if response status code is not equal 200. After 5 retries webhook will be dropped and nevery delivered.

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

Also, for messages, the contact representation in the hook may differ, depending on whether the message is incoming or outgoing.

When sending outbound messages from Pact, the hook will show an internal contact that has an `internal_id`, but never an `external_id` or `external_public_id`.

When an incoming message is received, the webhook will display an external contact that has an `external_id` and `external_public_id`, but never an `internal_id`.

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

* <b>Disconnected</b> ("event": "update", "state": "disabled") - Triggered when the auth is disconnected from the external service.

* <b>Deleted</b> ("event": "delete") - Triggered when the auth is permanently deleted.


#### Webhook Auth Object Parameters

[Auth object](#v2-auth-object)

> Webhook when creating a conversation:

```json
{
  "event": "create",
  "type": "conversation",
  "object": {
    "id": 216291470,
    "company_id": 96467,
    "sender_name": "70000000000",
    "sender_phone": "70000000000",
    "sender_external_id": "70000000000",
    "sender_external_public_id": "70000000000",
    "provider": "whatsapp",
    "avatar_url": "path to file",
    "created_at": "2025-08-31T13:28:00.562Z",
    "last_updated_at": "2025-08-31T13:28:00.000Z",
    "last_message_id": 1315284110,
    "operational_state": "open",
    "replied_state": "unreplied",
    "group": false
  }
}
```

### Conversation Webhooks:

These webhooks are sent when a Conversation is created or updated. Accordingly, two types of events are available:

* <b>Created</b> ("event": "create") -  Triggered when a new auth is created.
* <b>Update</b> ("event": "create") -  Triggered when information inside a Conversation is updated, for example when a new message arrives and the `"last_message_id"` field is updated.
* <b>Delete</b> ("event": "create") -  Triggered when a Conversation is deleted.

#### Webhook Conversation  Object Parameters
[Conversation  object](#v2-conversation-object)
