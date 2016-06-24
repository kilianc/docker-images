# A list of Node.js based [public](https://hub.docker.com/r/kilianciuffolo) Docker images.

Updated weekly with all available Node.js versions. Based on [debian:jessie](https://hub.docker.com/r/library/debian/tags/)

## Usage

    $ docker run --rm kilianciuffolo/node:6.2.2 node -v
    v6.2.2

## [kilianciuffolo/node](https://hub.docker.com/r/kilianciuffolo/node/tags/)

### [Dockerfile](https://github.com/kilianc/docker-images/blob/master/node/dockerfile-node)

```dockerfile
# boilerplate
FROM debian:jessie
MAINTAINER me@nailik.org

ENV DEBIAN_FRONTEND noninteractive

# pkgs
RUN \
  apt-get update && \
  apt-get install --no-install-recommends -y -q \
    ca-certificates \
    curl \
    g++ \
    git \
    make \
    python \
    && \
  apt-get clean autoclean && \
  apt-get autoremove -y && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/

# node
ENV PATH $PATH:/node/bin

RUN \
  export NODE_VERSION=__VERSION__ && \
  export NODE_URL=http://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz && \
  mkdir /node && \
  curl --silent $NODE_URL | tar xvzf - -C /node --strip-components=1
```

## [kilianciuffolo/wercker](https://hub.docker.com/r/kilianciuffolo/wercker/tags/)

### [Dockerfile](https://github.com/kilianc/docker-images/blob/master/node/dockerfile-wercker)

```dockerfile
# boilerplate
FROM kilianciuffolo/node:__VERSION__
MAINTAINER me@nailik.org

ENV DEBIAN_FRONTEND noninteractive

# pkgs
RUN \
  apt-get update && \
  apt-get install --no-install-recommends -y -q \
    awscli \
    graphicsmagick \
    libpng-dev \
    ssh \
    && \
  apt-get clean autoclean && \
  apt-get autoremove -y && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/
```
