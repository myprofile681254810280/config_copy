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
