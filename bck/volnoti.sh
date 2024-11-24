#!/bin/bash
export GTK_THEME=Arc

export GTK2_RC_FILES=~/.gtkrc-2.0.mine:/usr/share/themes/Arc/gtk-2.0/gtkrc:
exec volnoti
