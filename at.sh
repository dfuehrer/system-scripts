#!/usr/bin/env sh

at="$1" && shift

ats="$(date -d "$at" +%s.%N)"
nows="$(date +%s.%N)"

diff="$(echo "$ats - $nows" | bc -l)"

sleep "$diff"s && exec "$@"
