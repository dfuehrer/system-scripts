#!/bin/sh
packages=$(echo $@ | awk -v 'RS=\\s' '{printf "^%s$|", $0}' - | sed 's/|$//') && pacman -Slq | grep -E "$packages" | tr -s '\n' ' '
