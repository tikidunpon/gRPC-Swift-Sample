PROTO_DIR_CLIENT = gRPC-Client-Sample/gRPC-Client-Sample/Generated
PROTO_DIR_SERVER = gRPC-Server-Sample/gRPC-Server-Sample/Generated

.PHONY: protoc_client
protoc_client:
	protoc helloworld.proto \
	--swift_out=$(PROTO_DIR_CLIENT) \
	--swiftgrpc_out=Client=true,Server=false,TestStubs=true:$(PROTO_DIR_CLIENT)

.PHONY: protoc_server
protoc_server:
	protoc helloworld.proto \
	--swift_out=$(PROTO_DIR_SERVER) \
	--swiftgrpc_out=Client=false,Server=true,TestStubs=false:$(PROTO_DIR_SERVER)