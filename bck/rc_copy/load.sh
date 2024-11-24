#!/bin/bash
cd ~/config/rc_copy/

#复制出来的备份文件
bash ./load_kde.sh
cp ./.emacs ~/

mkdir ~/.config/mcomix/ -p
cp ./mcomix/* ~/.config/mcomix/
mkdir ~/.config/ppsspp/PSP/SYSTEM/ -p
cp ./ppsspp/* ~/.config/ppsspp/PSP/SYSTEM/
mkdir ~/.config/htop/ -p
cp ./htoprc ~/.config/htop/
mkdir ~/.config/sakura/ -p
cp ./sakura.conf ~/.config/sakura/
mkdir ~/.config/smplayer/ -p
cp ./smplayer/* ~/.config/smplayer/
mkdir ~/.config/vlc/ -p
cp ./vlcrc ~/.config/vlc/


cp --backup=numbered -r ./pcmanfm-qt ~/.config/ 


cp ./compiz/Default.ini ~/.config/compiz/compizconfig/
#有常用命令往这里添加
cp ./rofi-3.runcache ~/.cache/


#dconf
dconf load /org/onboard/ < ./conf/onboard

#gconf
gconftool-2 --load ./conf/docky
