#!/bin/sh
echo -ne '\033c\033]0;Challenge #1 - Pong\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Challenge #1 - Pong.x86_64" "$@"
