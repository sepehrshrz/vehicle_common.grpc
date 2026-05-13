all: build

rebuild:
	@rm -Rf ./genproto
	@[ -f "./proto.sh" ] && ./proto.sh || echo "no proto.sh"
build:
	@[ -f "./proto.sh" ] && ./proto.sh || echo "no proto.sh"

debug:
	@[ -f "./proto.sh" ] && ./proto.sh || echo "no proto.sh"

clean:
	rm -Rf ./genproto


# go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
# sudo apt install protobuf-compiler
# go get -u github.com/golang/protobuf/{proto,protoc-gen-go}
# go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
# protoc --go_out=. --go-grpc_out=. proto/inner.proto