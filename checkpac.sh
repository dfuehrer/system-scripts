#!/bin/sh
#packages=$(echo $@ | awk -v 'RS=\\s' '{printf "^%s$|", $0}' - | sed 's/|$//')
packages=$(echo -n "$@" | tr -s '[:space:]' '|')
pacman -Slq | grep -Ex "$packages" | tr -s '\n' ' '
