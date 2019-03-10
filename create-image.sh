#!/bin/bash

set -xe

cur_dir=$(dirname "$(readlink -f "$0")")

sudo docker build -t ruuvi-collector:$(<"$cur_dir"/configuration-description.txt) .

echo "Created new image, stop old container, rename it, start new container with 'start-collector.sh'."
