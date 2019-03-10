#!/bin/bash

set -xe

sudo docker pull maven:3.6-jdk-8-alpine

echo "Updated maven base image. Update dependencies in pom.xml, build new image with 'create-image.sh'."
