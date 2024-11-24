#!/bin/bash
orientation=`python ~/bin/rot.py "$1"`

if [[ "$WINDOW_MANAGER" = kwin ]];then
    bash ~/app/kwin/wallpaper/run.sh &

    #n卡rot时有丢失声音的问题,只能重启这些app
#    bash ~/bin/daemons/mpd.sh &
    #bash ~/git/panon/run-server.sh &

    #bash ~/bin/compiz/panel &
else
    bash ~/app/compiz/rot.sh $orientation
fi
