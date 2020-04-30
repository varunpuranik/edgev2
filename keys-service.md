# API

## Generate New Symmetric Key

`POST /key`

### Request

```json
{
    "keyId": "...",
    "lengthBytes": 32
}
```

### Response

```json
{
    "keysServiceHandle": "string"
}
```

---

## Get Existing Symmetric Key

`GET /key/{keyId}`

### Response

```json
{
    "keysServiceHandle": "string"
}
```

---

## Generate New Asymmetric Key Pair

`POST /keypair`

### Request

```json
{
    "keyId": "string",
    "algorithm": "..."
}
```

- `algorithms` dictates the caller's preference for the key algorithm. It is a string with components separated by COLON U+003A `:`, where each component specifies the name of an algorithm and will be attempted by the KS in that order. The valid components are `"ec-p256"` for secp256r1, `"rsa-2048"` for 2048-bit RSA, `"rsa-4096"` for 4096-bit RSA, and `"*"` which indicates any algorithm of the KS's choice. For example, the caller might use `"ec-p256:rsa-2048:*"` to indicate that it would like the KS to use secp256r1, else RSA-2048 if that fails, else any other algorithm of the KS's choice if that also fails.

    If the KS does not recognize a particular component as an algorithm, or is unable to use the algorithm to generate a key pair, it should ignore that component and try the next one. If no components are left, the KS will return an error. It is allowed for the KS to unable to generate a key pair even if the wildcard algorithm is specified.

    If `algorithms` is not specified, it will be interpreted the same as if it was `"*"`.

### Response

```json
{
    "keysServiceHandle": "string"
}
```

---

## Get Existing Asymmetric Key Pair

`GET /keypair/{keyPairId}`

### Response

```json
{
    "keysServiceHandle": "string"
}
```

---

## Get Parameter of Asymmetric Key Pair

`GET /keypair/{keyPairId}/parameter/{parameterName}`

### Response

```json
{
    "value": ...
}
```

The value of `value` in the response depends on the `parameterName`:

- `algorithm`: string, one of "ECDSA" and "RSA".

- `ec-curve-oid`: base64-encoded string containing the OID of the key's curve, in DER encoding. Only valid for ECDSA keys.

- `ec-point`: base64-encoded string containing the key's point. Only valid for ECDSA keys.

- `rsa-modulus`: base64-encoded string containing the key's modulus. Only valid for RSA keys.

- `rsa-exponent`: base64-encoded string containing the key's exponent as a big-endian bignumber. Only valid for RSA keys.

---

## Sign

`POST /sign`

This includes both digital signatures using asymmetric keys and HMAC-SHA256 using symmetric keys.

### Request

#### ECDSA

Only valid for ECDSA keys.

Note that the request takes the message digest, ie it must be calculated by the client.

```json
{
    "keysServiceHandle": "string",
    "algorithm": "ECDSA",
    "parameters": {
        "digest": "base64-encoded-string",
    }
}
```

#### RSA PKCS1

Only valid for RSA keys.

Note that the request takes the input and calculates the message digest.

```json
{
    "keysServiceHandle": "string",
    "algorithm": "RSA_PKCS1",
    "parameters": {
        "messageDigestAlgorithm": "SHA1/SHA256/SHA384/SHA512",
        "message": "base64-encoded-string"
    }
}
```

#### RSA PSS

Only valid for RSA keys.

Note that the request takes the message digest, ie it must be calculated by the client.

TODO: arsing to validate parameters required for PSS.

```json
{
    "keysServiceHandle": "string",
    "algorithm": "RSA_PSS",
    "parameters": {
        "maskGenerationFunction": "SHA1/SHA224/SHA256/SHA384/SHA512",
        "saltLength": 20,
        "digest": "base64-encoded-string"
    }
}
```

#### HMAC-SHA256

```json
{
    "keysServiceHandle": "string",
    "algorithm": "HMAC-SHA256",
    "parameters": {
        "message": "base64-encoded-string"
    }
}
```

### Response

```json
{
    "signature": "base64-encoded-string"
}
```
