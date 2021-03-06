#!/bin/sh
clipctl disable
cleanup () { clipctl enable; }
trap cleanup EXIT
passmenu "$@"
