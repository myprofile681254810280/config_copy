#!/bin/fish

#给fish下的新文件加上严格的权限,
#umask 0077
#一些情况下会带来问题,比如说sudo su后安装bootstrap
#也就是说是因为sudo 继承了umask导致的,所以或许可以在root那边用配置重置umask

if [ $QMLTERM_THEME ]
else
    export QMLTERM_THEME='transparent'
end

if [ $THEME_FISH ]
else
    export THEME_FISH='dark'
end

if [ 'black' = $QMLTERM_THEME ]
#    source ~/config/rc/fish/theme-cbjohnson/fish_prompt.fish
#    source ~/config/rc/fish/theme-budspencer/fish_greeting.fish
#    source ~/config/rc/fish/theme-budspencer/fish_prompt.fish
#    source ~/config/rc/fish/theme-budspencer/fish_mode_prompt.fish
#    source ~/config/rc/fish/theme-budspencer/fish_right_prompt.fish
#    source ~/config/rc/fish/theme-budspencer/fish_prompt.fish
    source ~/.config/fish/theme-bobthefish/fish_prompt.fish
  #  source ~/config/rc/fish/shellder/fish_prompt.fish
  #  source ~/config/rc/fish/theme-bobthefish/fish_greeting.fish
  #  source ~/config/rc/fish/theme-bobthefish/fish_title.fish
  #  这东西不能用,连按回车的时候就会感觉到很耗性能.
   # source ~/config/rc/fish/theme-bobthefish/fish_right_prompt.fish
else if [ 'transparent' = $QMLTERM_THEME ]
    source ~/.config/fish/prompt_git.fish
    source ~/.config/fish/prompt_pwd.fish
    source ~/.config/fish/fish_prompt.fish
end

if [ 'dark' = $THEME_FISH ]
    source ~/.config/fish/color_dark.fish
end


source ~/.config/fish/fish_title.fish

set LS_ARGUMENTS ' '

#覆盖一些危险的命令。
#alias rm='echo this is trash-cli;trash'
#alias rm='trash'
#这两条命令的确弄丢过数据,但是很多时候似乎的确会依赖它们清理掉无用的文件.
#不过其实除了大文件以外,多一份备份关系也不大,可以事务处理完毕后再清理的.
alias mv="mv --backup=numbered "
alias cp="cp --backup=numbered "
#带进度的复制
#alias gcp="rsync -a --progress "

alias dc='echo dc'

alias l='ls -CF  --hide="*.pyc" --hide="__pycache__"'
alias ll='ls -aF '
alias lll='ls -alF'


alias q='exit'

#alias vim="bash ~/bin/custom/vim"
#alias vi="bash ~/bin/custom/vim"
#alias v="bash ~/bin/custom/vim"

#alias commit="bash ~/bin/git/git_commit_push.sh"
alias bash="bash ~/bin/filter/bash_filter.sh"
#自定义的ipython没什么用
#alias ipython="bash ~/bin/custom/ipython"
#set EDITOR vim
#alias emacs="bash ~/bin/custom/emacs"
#emacs中的拼音切换比vim方便,更适合记录中文
#alias e="bash ~/bin/custom/emacs"

alias r=ranger
alias v=vim

#alias qmlterm="~/git/qmlterm/build/qmlterm"


#做不到直接赋值COLORFGBG,所以放这里了.
if [ $MY_COLOR ]
    set COLORFGBG $MY_COLOR
end

#.xprofile .xsessionrc裏面放了都沒效果,只好放這裏了
#bash ~/bin/keys.sh


#export fish_greeting=
#set -gx PATH $PATH $HOME/.local/bin $HOME/dmzj/bin
#set -gx PATH $PATH /mybin/bin
#set LD_LIBRARY_PATH /opt/cuda/lib64 $LD_LIBRARY_PATH

#source ~/config/rc/shell_env.sh

export TERM=xterm-256color
