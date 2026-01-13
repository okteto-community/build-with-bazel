#!/bin/bash
set -e

IMAGE_TAG="${IMAGE_TAG:-okteto}"
IMAGE_REPO="ttl.sh/okteto-community/build-with-bazel/hello-world"

# Build the push script with Bazel
bazel build //:server_image.push

# Get the generated push script
PUSH_SCRIPT="bazel-bin/push_server_image.push.sh"

# Modify the script to use our dynamic tag by replacing "latest" with our tag
sed "s|:latest|:${IMAGE_TAG}|g" "$PUSH_SCRIPT" > /tmp/push_with_tag.sh
chmod +x /tmp/push_with_tag.sh

# Execute the modified push script
/tmp/push_with_tag.sh
