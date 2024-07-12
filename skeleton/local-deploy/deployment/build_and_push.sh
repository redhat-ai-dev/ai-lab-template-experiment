#!/bin/bash

dir=$(dirname $0)

MODEL_PATH=${MODLE_PATH:-"$dir/./model_server"}
APP_PATH=${APP_PATH:-"$dir/../Containerfile"}

IMAGE_TAG="latest"
APP_IMAGE_NAME="${{ values.imageRegistry }}/${{ values.imageOrg }}/${{ values.imageName }}"
APP_IMAGE_FULL="$APP_IMAGE_NAME":"$IMAGE_TAG"
MODEL_IMAGE_NAME="${{ values.imageRegistry }}/${{ values.imageOrg }}/${{ values.modelServer }}"
MODEL_IMAGE_FULL="$MODEL_IMAGE_NAME":"$IMAGE_TAG"

podman build -t "$MODEL_IMAGE_FULL" -f "$MODEL_PATH"/base/Containerfile "$MODEL_PATH"
podman push "$MODEL_IMAGE_FULL"

podman build -t "$APP_IMAGE_FULL" -f "$APP_PATH"
podman push "$APP_IMAGE_FULL"

exit 0
