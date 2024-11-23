#!/bin/fish

function __budspencer_git_status -d 'Check git status'
  set -l git_status (command git status --porcelain  --ignore-submodules=dirty --untracked-files=normal 2> /dev/null | cut -c 1-2)
  #set -l git_status (command git status --porcelain 2> /dev/null | cut -c 1-2)
  set -l added (echo -sn $git_status\n | grep -E -c "[ACDMT][ MT]|[ACMT]D")
  set -l deleted (echo -sn $git_status\n | grep -E -c "[ ACMRT]D")
  set -l modified (echo -sn $git_status\n | grep -E -c ".[MT]")
  set -l renamed (echo -sn $git_status\n | grep -E -c "R.")
  set -l unmerged (echo -sn $git_status\n | grep -E -c "AA|DD|U.|.U")
  set -l untracked (echo -sn $git_status\n | grep -E -c "\?\?")
  echo -n $added\n$deleted\n$modified\n$renamed\n$unmerged\n$untracked
end

function __budspencer_is_git_ahead_or_behind -d 'Check if there are unpulled or unpushed commits'
  if set -l ahead_or_behind (command git rev-list --count --left-right 'HEAD...@{upstream}' 2> /dev/null)
    echo $ahead_or_behind | sed 's|[[:space:]]|\n|g'
  else
    echo 0\n0
  end
end

function prompt_git -d "Display the current git state"

  set -l is_repo (command git rev-parse --is-inside-work-tree 2> /dev/null)
  if [ -z $is_repo ]
    return
  end

  set GIT_ROOT (git rev-parse --show-toplevel)
  if [ "$HOME" = "$GIT_ROOT" ] 
    return
  end

    set ref (command git symbolic-ref HEAD 2> /dev/null)
    if [ $status -gt 0 ]
      set -l branch (command git show-ref --head -s --abbrev |head -n1 2> /dev/null)
      set ref "➦ $branch "
    end
    set branch_symbol ''  #\uE0A0
    set -l branch (echo $ref | sed  "s-refs/heads/-$branch_symbol-")



    set -l dirty (command git status --porcelain --ignore-submodules=dirty 2> /dev/null)

    if [ "$dirty" = "" ]
      set BG DDDDFF
    else
      set BG FFFF00
    end
    #改了这里
    #

    set -l git_ahead_behind (__budspencer_is_git_ahead_or_behind)
  
    if [ $git_ahead_behind[1] -gt 0 ]
      set BG 77FF77
    end

    if [ $git_ahead_behind[2] -gt 0 ]
      set BG FF77FF
    end

    echo (set_color $BG)$branch' '

    set -l git_status (__budspencer_git_status)
    if [ $git_status[1] -gt 0 ]
      echo (set_color green)$git_status[1]' ' #' +'
    end
    #deleted modified renamed untracked
    set -l num (math $git_status[2]+$git_status[3]+$git_status[4]+$git_status[6])
    if [ $num -gt 0 ]
      echo (set_color red)$num' ' #' +'
    end
    if [ $git_status[5] -gt 0 ]
      echo -n ' ═'
    end
    #echo (set_color $BG)$branch$git_ahead_count' '
end
