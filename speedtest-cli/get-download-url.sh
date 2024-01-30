#!/bin/sh

ARCH=$1

case "$ARCH" in
x86) _arch=i386 ;;
armv7) _arch=armhf ;;
*) _arch="$ARCH" ;;
esac

curl -sSL "https://www.speedtest.net/apps/cli" | sed -E -e 's/<|>|\s/\n/g' | grep href | grep "install.speedtest.net" | grep "linux-${_arch}" | sed "s|href=||" | sed 's|"||g'
