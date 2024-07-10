#!/bin/bash

AI_LAB_HOME=${AI_LAB_HOME:-"$HOME/.local/share/containers/podman-desktop/extensions-storage/redhat.ai-lab"}

BASE_DIR=$(dirname "$0")
CATALOG="$BASE_DIR/user-catalog.json"

echo "Copying $CATALOG to $AI_LAB_HOME ..."
cp $CATALOG $AI_LAB_HOME
if [ $? -ne 0 ]; then
    echo "An error occurred copying $CATALOG, ensure the user-catalog.json file exists as well as the ai extension storage directory."
    exit 1
fi
echo "File copied successfully."

exit 0