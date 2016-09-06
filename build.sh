#!/bin/bash

set -e

source ./versions.sh

function build_image {
  local dockerfile_path="$1"
  local base_image_name="$2"
  local image_name="$2:$3"
  local node_version_in="$4"

  docker pull $image_name || true

  local dockerfile=$(cat "$dockerfile_path" | sed "s/__VERSION__/$node_version_in/g")
  local build_output=$(echo "$dockerfile" | docker build -t "$image_name" -)
  local node_version_out=$(docker run --rm --entrypoint node "$image_name" -v)

  if [[ "$node_version_out" != "v$node_version_in" ]]; then
    echo " > error node_version=$node_version_out expected v$node_version_in"
    echo "$build_output"
    return 1
  fi

  echo " > $image_name -> $node_version_out"
}

function build_images {
  local dockerfile_path="$1"
  local base_image_name="$2"

  for version in "${VERSIONS[@]}"; do
    build_image "$dockerfile_path" "$base_image_name" "$version" "$version"
  done

  build_image "$dockerfile_path" "$base_image_name" "latest" "$version"
}

base_image_name="$(echo "kilianciuffolo/$1" | sed "s/dockerfile-//")"
build_images "$1" "$base_image_name"
