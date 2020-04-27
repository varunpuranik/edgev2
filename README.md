IoT Edge v2 is made up of several independent services instead of one monolithic `iotedged`

- [Identity Service](identity-service.md)

    Handles provisioning.


- [Keys Service](keys-service.md)

    Stores keys and allows callers to perform operations with those keys like encrypt, decrypt, sign.


- [Certificates Service](certificates-service.md)

    Stores certificates and allows callers to import and export them.


- [Module Runtime](module-runtime.md)

    Runs Edge modules, like `iotedged` today, though not necessarily specifically Docker containers.


Each component talks to the other components over RPC of some sort (TODO: HTTP-over-UDS? gRPC-over-UDS? D-Bus? Something else?)


# Provisioning

- [X.509 device ID cert](provisioning-x509-deviceid.md)


# Runtime operation

- [Modules via module runtime for containers (similar to current iotedged)](mr-operation.md)
