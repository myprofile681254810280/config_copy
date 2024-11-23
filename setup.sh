#ROOT="$(dirname "$(realpath "$0")")"
#echo "$ROOT"

cp kwinrulesrc ~/.config/

rm ~/.config/mpv -r
cp mpv -r ~/.config

#plasma 相关的一组，似乎不完全是关于plasmashell的，但是应该都有用
cp plasma-org.kde.plasma.desktop-appletsrc ~/.config/
cp plasmanotifyrc ~/.config/
cp plasmaparc ~/.config/
cp plasmarc ~/.config/
cp plasmashellrc ~/.config/

#kwinrc有另外一个对选项注释更清晰，用configwriter写的备份。   但是configwriter还有接口升级之类的问题，反而直接保存的这份更方便，  不过没有注释还是很大的缺点。可以考虑把configwriter的那份留下作为注释，在需要的时候看
cp kwinrc  ~/.config/

#这里有屏幕亮度，以及关机睡眠方面的配置
cp powerdevilrc  ~/.config/


