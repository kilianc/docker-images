#!/bin/bash

set -e

source ./versions.sh

function push_image {
  echo ""
  echo " > pushing to $1"
  echo ""
  docker push "$1"
}

function push_images {
  local base_image_name="$1"

  for version in "${VERSIONS[@]}"; do
    push_image "$base_image_name:$version"
  done
}

base_image_name="$(echo "kilianciuffolo/$1" | sed "s/dockerfile-//")"
push_images "$base_image_name"
