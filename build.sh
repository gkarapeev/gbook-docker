#!/bin/sh

pi_base_img="--platform=linux/arm64 alpine:3.22"
pc_base_img="frolvlad/alpine-glibc:alpine-3.18"
macos_base_img="frolvlad/alpine-glibc:alpine-3.18"

case "$1" in
  pi)   base_img="$pi_base_img" ;;
  pc)   base_img="$pc_base_img" ;;
  mac)  base_img="$macos_base_img" ;;
  *)    echo "Usage: $0 [pi|pc|mac]" && exit 1 ;;
esac

docker build --build-arg BASE_IMAGE="$base_img" -t gbook-img .
