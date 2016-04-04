#!/bin/bash

set -e

VERSIONS=(
  0.12.7
  0.12.8
  0.12.9
  0.12.10
  0.12.11
  0.12.12
  0.12.13
  4.0.0
  4.1.0
  4.1.1
  4.1.2
  4.2.1
  4.2.2
  4.2.3
  4.2.4
  4.2.5
  4.2.6
  4.3.0
  4.3.1
  4.3.2
  4.4.0
  4.4.1
  4.4.2
  5.0.0
  5.1.0
  5.1.1
  5.2.0
  5.3.0
  5.4.0
  5.4.1
  5.5.0
  5.6.0
  5.7.0
  5.7.1
  5.8.0
  5.9.0
  5.9.1
  5.10.0
)

function build_image {
  local dockerfile_path="$1"
  local base_image_name="$2"
  local image_name="$2:$3"
  local node_version_in="$4"

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

function push {
  echo " > pushing to https://hub.docker.com/r/$1/tags/"
  docker push "$1"
}

base_image_name="$(echo "kilianciuffolo/$1" | sed "s/dockerfile-//")"
build_images "$1" "$base_image_name"
push "$base_image_name"
