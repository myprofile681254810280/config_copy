#!/bin/bash 

#cron锁,防止cron运行中重启
LOCK=/tmp/cron_running.lock
if [ -f "$LOCK" ];then
    echo cron locked
else
    echo pkill
    echo swapoff

    sleep 1

    echo unmount
    udisksctl unmount -b /dev/disk/by-label/dmzj 
    udisksctl unmount -b /dev/disk/by-label/4T
    udisksctl unmount -b /dev/disk/by-label/usb1
    udisksctl unmount -b /dev/disk/by-label/usb2

    #bash ~/config/rc/emacs/update.sh
    #cron中事先已经通过pacman -Syuw 下载了软件包,这里仅仅是安装
    #sudo /update

    read -p reboot?
    echo reboot $(date) >> ~/del/log/reboot.log
    systemctl reboot 
fi
