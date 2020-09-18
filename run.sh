#!/usr/bin/env bash
set -euo pipefail

docker pull ubuntu:14.04
docker build -t firefox .

# Is 5900 the default port for VNC?
# meaning of HOME?
# removing DISPLAY because we have xvfb now
docker run -it --rm \
    -p 5900:5900 \
    firefox \
    x11vnc \
    -forever \
    -usepw \
    -create \