build: build-node build-http-server build-wercker
push: push-node push-http-server push-wercker
all: build-all push-all

build-node:
	./build.sh dockerfile-node

build-http-server:
	./build.sh dockerfile-http-server

build-wercker:
	./build.sh dockerfile-wercker

push-node:
	./push.sh dockerfile-node

push-http-server:
	./push.sh dockerfile-http-server

push-wercker:
	./push.sh dockerfile-wercker

.PHONY: all build-all push-all build-node build-http-server build-wercker push-node push-http-server push-wercker
