#!/bin/fish
function fish_prompt --description 'Write out the prompt'

   #echo -n -s ' '  (prompt_pwd) ' ' (prompt_git) (set_color FFFFFF) '> '
   
#通过wallpaperrc判定是不是host,因为它没有github同步,以后或许可以改成其他文件
    if test -e ~/.wallpaperrc
   #普通路径
   echo -n -s ' '  (prompt_pwd) ' ' (prompt_git) (set_color normal) '> '
    else
   echo -n -s ' ' $USER ' '  (prompt_pwd) ' ' (prompt_git) (set_color normal) '> '
    end

   #缩略短路径,路径太长的时候有用,但是平时不能用,最好是有什么长度判断可以自动切换 
   #echo -n -s ' '  (prompt_pwd_short) ' ' (prompt_git) (set_color normal) '> '
   
    #   echo -n -s ' '  (prompt_pwd) ' ' (prompt_git) '> '
end
