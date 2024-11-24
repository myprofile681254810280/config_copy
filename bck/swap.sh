#避免内存不够用,做个临时缓存文件
#用sudo运行
#重启后删除没问题
#运行中删除见
#https://wiki.archlinux.org/index.php/swap#Swap_file
#swapoff -a #这个可以直接加入reboot脚本
#或者 swapoff $SWAPFILE
#然后删除文件

#一点问题是,即使单纯用内存,都会出现错误了,用缓存一样会造成很多错误吧
#所有如果有内存出错率要求的话,应该要避免用缓存吧

#一般用的时候,最耗内存的就是chromium了

#注意一下,开了swap之后,关机会比较费时间,但不是关不掉

#缓存文件建立后不必删除
#平时只需要执行 swapon和swapoff命令就可以了,不需要再执行这个脚本了

SWAPFILE=/home/swapfile
#fallocate -l 8G $SWAPFILE
dd if=/dev/zero of=$SWAPFILE bs=1M count=8000 status=progress
chmod 600 $SWAPFILE
mkswap $SWAPFILE
swapon $SWAPFILE


