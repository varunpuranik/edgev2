# API

## Create New Certificate from CSR

`POST /certificate`

### Request

```json
{
    "certId": "...",
    "csr": "base64-encoded-string",
    "issuerName": "string"
}
```

`issuerName` is optional. Certificate will be self-signed if it is not provided and the CSR requests the CA constraint.

### Response

```json
{
    "pem": "string"
}
```

---

## Import Certificate

`PUT /certificate/{certId}`

### Request

```json
{
    "pem": "string"
}
```

### Response

```json
{
    "pem": "string"
}
```

---

## Get Existing Certificate

`GET /certificate/{certId}`

### Response

```json
{
    "pem": "string"
}
```

---

## Get All Certificates

`GET /certificate`

### Response

```json
{
    "certificates": [
        {
            "pem": "string"
        },
        ...
    ]
}
```
