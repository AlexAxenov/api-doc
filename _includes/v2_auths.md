## Auths
> Webhook without page:

```json
{
  "event": "create",
  "type": "auth",
  "object": {
    "id": 69174,
    "company_id": 52368,
    "provider": "whatsapp",
    "state": "enabled",
    "phone_number": "79000000000",
    "created_at": "2025-06-23T14:33:47.886Z",
    "updated_at": "2025-06-23T14:33:47.886Z",
    "sync_messages_at": "2025-06-22T14:33:47.877Z"
  }
}
```
### Response Parameters
<p id="v2-auth-object"></p>

 Auth object

* <b>id</b> (Integer) - ID Auth
* <b>company_id</b> (Integer) - ID of the company
* <b>provider</b> (String) - Name of the connected messenger
* <b>state</b> (String ) - Connection status, can be `disabled` or `enabled`
* <b>phone_number</b> (Integer) - Phone number of the connected messenger (only available for messengers that transmit the account's phone number)
* <b>username</b> (String ) - Username of the connected messenger (only available for messengers that transmit the account's username)
* <b>created_at</b> (Time) - Auth connection time
* <b>updated_at</b> (Time) - Last update time
* <b>sync_messages_at</b> (Time) - The time from which the synchronization of messages began
* <b>pages</b> (Object) - Some providers may provide a list of pages that can be connected to. Additional parameters will be passed for this purpose.

> Webhook with pages:

```json
{
  "event": "update",
  "type": "auth",
  "object": {
    "id": 69167,
    "company_id": 52368,
    "provider": "vkontakte",
    "state": "enabled",
    "created_at": "2025-06-20T08:10:20.517Z",
    "updated_at": "2025-06-23T15:31:00.275Z",
    "sync_messages_at": "2025-06-20T08:10:36.951Z",
    "pages": [
      {
        "id": 30190,
        "auth_id": 69167,
        "company_id": 52368,
        "external_id": "229559196",
        "name": "Test1",
        "enabled": true
      },
      {
        "id": 30191,
        "auth_id": 69167,
        "company_id": 52368,
        "external_id": "223020390",
        "name": "Test2",
        "enabled": false
      }
    ]
  }
}
```
Pages object
* <b>id</b> (Integer) - Page ID
* <b>auth_id</b> (Integer) - Auth id to which the page belongs
* <b>company_id</b> (Integer) - Company id to which the page belongs
* <b>external_id</b> (Integer) - External page Id
* <b>name</b> (String) - Page title
* <b>enabled</b> (String) - Page connection status, can be true or false