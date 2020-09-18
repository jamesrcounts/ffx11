#!/usr/bin/env bash
set -euo pipefail

docker pull ubuntu:14.04
docker build -t firefox .

# Note that the DISPLAY variable is set by X11 when running in a linux desktop
# Note that the .X11-unix socket from the local linux machine is shared with the docker container
docker run -it --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    firefox