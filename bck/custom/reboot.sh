 if zenity --question --text=reboot?;then
     cd ~
     ~/bin/reboot.sh
 else
     echo 0;
 fi
