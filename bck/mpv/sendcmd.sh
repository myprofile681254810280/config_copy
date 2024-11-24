#!/bin/bash
UID=`id -u $USER`
echo "$@" | socat - /run/user/$UID/mpvsocket
