#!/bin/sh
clipctl disable
cleanup () { clipctl enable; kill 0; }
trap cleanup EXIT
passmenu "$@"
