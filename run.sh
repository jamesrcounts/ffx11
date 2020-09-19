#!/usr/bin/env bash
set -euo pipefail

docker pull ubuntu:20.04
docker build -t firefox .

# Removed port 5901 because x11vnc is running with -localhost only access in every case
# You can override CMD with /bin/bash to get an interactive shell, desktop will still run in background.
docker run -it \
    --rm \
    -p 6080:6080 \
    --init \
    --security-opt seccomp=unconfined \
    firefox