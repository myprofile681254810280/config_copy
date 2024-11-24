
#启动xbindkeys的位置,会影响到之后rofi 命令的相对路径
cd ~

#虽然xbindkey和tile的相性,但即使compiz0.8也只有24的按键组合.虽然我不知道我是否真的需要更多的.
#不过xbindkey是提供了超出24以后的扩展余地.
#实际上tile中除了focus以外的应该配合xbindkey使用也没有太大问题.
#另一方面感觉compiz0.8的focus似乎和xbindkey也差不多,好像也有双闪烁.

pkill xbindkeys
cd ~

#xbindkeys -f ~/config/rc/shortcuts/main
if [[ "$WINDOW_MANAGER" = "openbox" ]];then
    config=~/config/rc/shortcuts/openbox.scm
elif [[ "$WINDOW_MANAGER" = "kde" ]];then
    config=~/config/rc/shortcuts/openbox.scm
elif [[ "$WINDOW_MANAGER" = "kwin" ]];then
    ##kwin不会自动启动这个,plasma倒是会启动. 所以需要放在这里
    ##kcmshell5 khotkeys
    ##通过dbus启动的这个,不会传递环境变量,需要把各种环境变量转换到dbus中
    ##需要qt5-tools
    #qdbus org.kde.kded5 /kded org.kde.kded5.loadModule khotkeys
    ##在把环境变量转换到dbus之前,rofi需要由xbindkey启动以传递环境变量
    #kde6没有qdbus了，只有qdbus6

    #kde6带来bug，
    #config=~/config/rc/shortcuts/kwin.scm
    config=~/config/rc/shortcuts/kwin6.scm
else
    config=~/config/rc/shortcuts/main.scm
fi
xbindkeys -fg $config
