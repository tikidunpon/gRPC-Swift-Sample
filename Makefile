protoc_client:
	protoc helloworld.proto \
	--swift_out=GeneratedForClient \
	--swiftgrpc_out=Client=true,Server=false,TestStubs=true:GeneratedForClient

protoc_server:
	protoc helloworld.proto \
	--swift_out=GeneratedForServer \
	--swiftgrpc_out=Client=false,Server=true,TestStubs=false:GeneratedForServer