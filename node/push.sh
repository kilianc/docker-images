#!/bin/bash

set -e

function push {
  echo " > pushing to https://hub.docker.com/r/$1/tags/"
  docker push "$1"
}

base_image_name="$(echo "kilianciuffolo/$1" | sed "s/dockerfile-//")"
push "$base_image_name"
