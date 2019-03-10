#!/bin/bash

set -xe

cur_dir=$(dirname "$(readlink -f "$0")")

sudo docker run \
    -d \
    --name ruuvi-collector \
    --restart unless-stopped \
    --privileged \
    --net=host \
    ruuvi-collector:$(<"$cur_dir"/configuration-description.txt)

echo "Ruuvi-collector started. Verify it works then remove old container and image."
