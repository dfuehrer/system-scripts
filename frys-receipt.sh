#!/usr/bin/env sh

# TODO add options with clparser
[ -z "$1" ] && echo Usage: $0 reciept.pdf && exit
pdf="$1" && shift

pdftotext -nopgbrk "$pdf" /dev/stdout | exec frys-receipt.awk
