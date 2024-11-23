#!/bin/fish
function prompt_pwd --description 'Print the current working directory, NOT shortened to fit the prompt'

   echo $PWD | sed -e "s|^$HOME|~|"

   # if test "$PWD" != "$HOME"
   #     #printf "%s" (echo $PWD|sed -e 's|/private||' -e "s|^$HOME|~|")
   #     #printf "%s" (echo $PWD|sed -e "s|^$HOME|~|")
   #     echo $PWD | sed -e "s|^$HOME|~|"
   # else
   #     echo '~'
   # end
end

function prompt_pwd_short
   __bobthefish_path_segment "$PWD"
end

function __bobthefish_pretty_parent -S -a current_dir -d 'Print a parent directory, shortened to fit the prompt'
  echo -n (dirname $current_dir) | sed -e 's#/private##' -e "s#^$HOME#~#" -e 's#/\(\.\{0,1\}[^/]\)\([^/]*\)#/\1#g' -e 's#/$##'
end

function __bobthefish_path_segment -S -a current_dir -d 'Display a shortened form of a directory'
  set -l directory
  set -l parent
  switch "$current_dir"
    case /
      set directory '/'
    case "$HOME"
      set directory '~'
    case '*'
      set parent    (__bobthefish_pretty_parent "$current_dir")
      set parent    "$parent/"
      set directory (basename "$current_dir")
  end
  echo -n $parent
  echo -ns $directory 
end


