build: build-node
push: push-node
all: build push

build-node:
	./build.sh dockerfile-node

push-node:
	./push.sh dockerfile-node

.PHONY: all build-all push-all build-node push-node
