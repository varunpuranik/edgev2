# API

## Create or Import Certificate

`PUT /certificate/{certid}`

### Request to create certificate

```json
{
    "issuername": "string",
    "csr": "base64-encoded-string"
}
```

### Request to import certificate

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

## Load Certificate

`GET /certificate/{certid}`

### Response

```json
{
    "pem": "string"
}
```

---

## Get Certificate List

`GET /certificate`

### Response

```json
{
    "certificates": [
        {
            "pem": "string"
        }
    ]
}
```
