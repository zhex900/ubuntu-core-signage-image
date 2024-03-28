#!/bin/bash

# stop execution if any commands in this script fail
set -e


# Create the signed model assertation. 
echo Creating Model Assertation

# For convenience, we replace %TIMESTAMP% with the current time
TIMESTAMP=`date -Iseconds --utc`

sudo snap sign -k my-model-key ./ubuntu-image/arm64.json > ./ubuntu-image/arm64.model

# Build gadget-snap
echo "Build gadget snap"
cd gadget-snap
snapcraft
cd ..

# Build the image
echo Building ubuntu core image
sudo ubuntu-image snap ./ubuntu-image/arm64.model \
    --snap ./gadget-snap/pc_22-0.4_arm64.snap 
    # this is the electron app to render web content
    # --snap ./pam-app_1.1.1_arm64.snap 
