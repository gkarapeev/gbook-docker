#!/bin/sh

pi_base_img="alpine:3.22"
pc_base_img="frolvlad/alpine-glibc:alpine-3.22"
macos_base_img="frolvlad/alpine-glibc:alpine-3.22"

case "$1" in
	pi)
		base_img="$pi_base_img"
		platform_flag="--platform=linux/arm64"
		;;
	pc)
		base_img="$pc_base_img"		
		platform_flag=""
		;;
	mac)
		base_img="$macos_base_img"
		platform_flag=""
		;;
	*)
		echo "Usage: $0 [pi|pc|mac]" && exit 1 ;;
esac

echo "Using base image: $base_img"
echo "Using platform flag: $platform_flag"

docker build $platform_flag --build-arg BASE_IMAGE="$base_img" -t gbook-img .
