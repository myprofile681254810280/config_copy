#ROOT="$(dirname "$(realpath "$0")")"
#echo "$ROOT"

cd ./config || exit


cp kdeglobals ~/.config/
cp konsolerc ~/.config/
cp dolphinrc ~/.config/

#这个好像其实并没有被读取，但是暂且留一份，这份是给kwin用的
cp freetilerc ~/.config/

#
#rm ~/.config/yapf -r
cp yapf -r ~/.config

#主要是fcitx的外观配置，以及设定rime为主要输入法
#rm ~/.config/fcitx5 -r
cp fcitx5 -r ~/.config
#不记得是什么了，但是似乎是一些色彩配置，看起来像是kde用的
#rm ~/.config/default -r
#cp default -r ~/.config
#默认的mpv不太好用，比如说窗口的长宽是固定比例的
#rm ~/.config/mpv -r
#cp mpv -r ~/.config
#fontconfig基本上是手写的，需要备份
#rm ~/.config/fontconfig -r
cp fontconfig -r ~/.config
#一份基本的htop配置，实际用总会有各种改动
#rm ~/.config/htop -r
cp htop -r ~/.config
#最危险的配置，里面的交叉引用最多，应该考虑减少里面的交叉引用
#rm ~/.config/fish -r
cp fish -r ~/.config
#里面有一些css，似乎是选择arc theme的时候留下的，此外有用的是setting.ini,里面设置了icon选择
#rm ~/.config/gtk-3.0 -r
cp gtk-3.0 -r ~/.config
#rm ~/.config/gtk-4.0 -r
cp gtk-4.0 -r ~/.config
cp .gtkrc-2.0 ~/
cp .gtkrc-2.0.mine ~/

#plasma 相关的一组，似乎不完全是关于plasmashell的，但是应该都有用
cp plasma-org.kde.plasma.desktop-appletsrc ~/.config/
cp plasmanotifyrc ~/.config/
cp plasmaparc ~/.config/
cp plasmashellrc ~/.config/
#这里存放了desktoptheme的选择，现在是自制的breeze-dark-opaque
#并且，自从kde6开始，这里存放了contrast等参数，或许调整下会有很好的效果
cp plasmarc ~/.config/

#kwinrc有另外一个对选项注释更清晰，用configwriter写的备份。   但是configwriter还有接口升级之类的问题，反而直接保存的这份更方便，  不过没有注释还是很大的缺点。可以考虑把configwriter的那份留下作为注释，在需要的时候看
cp kwinrc  ~/.config/

#这里有屏幕亮度，以及关机睡眠方面的配置
cp powerdevilrc  ~/.config/

#两份非常冗余的快捷键设置，未来需要改动的话，大概需要大修消除冗余，但是现在并不想去改
#这份存放的是kwin自己的快捷键，比如alt tab workspace切换
cp kglobalshortcutsrc  ~/.config/
#这份是自定义的，快捷键到命令行的映射，和xbindkey功能重叠的是这个。但是它的api改动频繁，比如qdbus改成了qdbus6什么的，所以稳定使用还是xbindkey更好
#cp khotkeysrc  ~/.config/

#为了关掉而设置
cp kiorc ~/.config/
cp baloofilerc ~/.config/
# breezerc做了一些和kwinrule类似的操作, oxygen里面则是以前留下的类似配置，而现在并不用oxygen
# 此外breezerc中可以设置menu opacity=0，这算是和kv类似的设置，但是简陋很多，不过好像gui中没这个选项
cp kwinrulesrc ~/.config/
cp breezerc ~/.config/
cp oxygenrc ~/.config/


git config --global http.proxy $myproxy
pip config set global.proxy $myproxy









