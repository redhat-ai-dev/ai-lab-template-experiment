#!/bin/bash

if [ -z "$1" ]; then
  echo "FAILURE: Missing argument"
  echo "Usage: bash build_and_push.sh <path to docker/containerfile>"
  exit 2
fi

IMAGE_NAME="${{ values.imageRegistry }}/${{ values.imageOrg }}/${{ values.imageName }}"
IMAGE_TAG="latest"
IMAGE_FULL="$IMAGE_NAME":"$IMAGE_TAG"

podman build -t "$IMAGE_FULL" -f "$1"
podman push "$IMAGE_FULL"

exit 0