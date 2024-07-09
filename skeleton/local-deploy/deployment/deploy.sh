#!/bin/bash

if [ -z "$1" ]; then
  echo "FAILURE: Missing argument"
  echo "Usage: bash deploy.sh <path to ai extension>"
  exit 2
fi

BASE_DIR=$(dirname "$0")
CATALOG="$BASE_DIR/user-catalog.json"

echo "Copying $CATALOG to $1 ..."
cp $CATALOG $1
if [ $? -ne 0 ]; then
    echo "An error occurred copying $CATALOG, ensure the file exists and the ai extension argument path is correct."
    exit 1
fi
echo "File copied successfully."

exit 0