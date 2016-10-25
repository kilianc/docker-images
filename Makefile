build: build-node build-wercker
push: push-node push-wercker
all: build push

build-node:
	./build.sh dockerfile-node

build-wercker:
	./build.sh dockerfile-wercker

push-node:
	./push.sh dockerfile-node

push-wercker:
	./push.sh dockerfile-wercker

.PHONY: all build-all push-all build-node build-wercker push-node push-wercker
