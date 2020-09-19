#!/usr/bin/env bash
set -euo pipefail

docker pull ubuntu:20.04
docker build -t firefox .

docker run -it \
    --rm \
    -p 5901:5901 \
    -p 6080:6080 \
    --init \
    --security-opt seccomp=unconfined \
    firefox 