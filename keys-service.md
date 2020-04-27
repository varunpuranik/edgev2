# API

## Create Key

`PUT /key/{keyid}`

### Response

```json
{
    "keyStoreHandle": "string"
}
```

---

## Get Key

`GET /key/{keyid}`

### Response

```json
{
    "keyStoreHandle": "string"
}
```

---

## Create Key Pair

`POST /keypair`

### Request

```json
{
    "keypairid": "string",
}
```

### Response

```json
{
    "keyStoreHandle": "string"
}
```

---

## Load Key Pair

`GET /keypair/{keypairid}`

### Response

```json
{
    "keyStoreHandle": "string"
}
```

---

## Sign using Private Key

`POST /sign`

### Request

```json
{
    "keyStoreHandle": "string",
    "signAlgorithm": "ECDSA/RSA_PKCS1/RSA_PSS",
    "hashAlgorithm": "SHA1/SHA224/SHA256/SHA384/SHA512",
    "signParameters": {
        "maskGenerationFunction": "SHA1/SHA224/SHA256/SHA384/SHA512",
        "saltLength": 20
    },
    "digest": "string"
}
```

### Response
```json
{
    "signature": "string"
}
```
