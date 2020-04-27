# API

## Get IoT device provisioning result

`GET /identities/aziot/device`

### Response (SAS case)

```json
{
    "id": "aziot://myhub.net/device/device01",
    "managedBy": "aziot://myhub.net/",
    "auth": {
        "type": "sas",
        "keyStoreHandle": "string",
    }
}
```

### Response (X.509 case)

```json
{
    "id": "aziot://myhub.net/device/device01",
    "managedBy": "aziot://myhub.net/",
    "auth": {
        "type": "x509",
        "certicateStoreHandle": "string",
    }
}
```

---

## Trigger IoT device reprovisioning flow

`GET /identities/aziot/device/reprovision`

### Response

```
200 Ok
```
