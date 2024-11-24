#!/bin/bash

#加一个锁,可以方便重启的时候检测到
LOCK=/tmp/cron_running.lock


#前提是home目录路径是带有user的

export HOME=`realpath ~`
export USER=`realpath ~ | sed "s/\/home\///g"`


#无效
#export DISPLAY=":0.0"
#notify-send "$1" "$2"

mkdir ~/del

if [ -f "$LOCK" ];then
    "$@" &>> ~/del/cron.log
else
    touch $LOCK
    "$@" &>> ~/del/cron.log
    rm $LOCK
fi
