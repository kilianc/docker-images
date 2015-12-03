all: node http-server wercker

node:
	./build.sh dockerfile-node

http-server:
	./build.sh dockerfile-http-server

wercker:
	./build.sh dockerfile-wercker

.PHONY: all node http-server wercker
