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
        "keyId": "string"
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
        "keyId": "string",
        "certId": "string"
    }
}
```

`keyId` and `certId` are used with KS and CS respectively.

---

## Trigger IoT device reprovisioning flow

`POST /identities/aziot/device/reprovision`

### Response

```
200 Ok
```
