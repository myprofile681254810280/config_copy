#ROOT="$(dirname "$(realpath "$0")")"
#echo "$ROOT"
cp kwinrulesrc ~/.config/
rm ~/.config/mpv -r
cp mpv -r ~/.config
