autoload colors
colors

function _color256 { printf "\e[38;5;$1m" }
function color256 { echo "%{$(_color256 $1)%}" }

RED="$(color256 9)"
BLUE=$(color256 117)
CBLUE=$(color256 81)
YELLOW=$(color256 229)
BROWN=$(color256 143)
PINK=$(color256 177)
SALMON=$(color256 204)
GREEN=$(color256 155)
RED=$(color256 9)
RESET="%{$reset_color%}"



char_x="✗"
ZSH_THEME_GIT_PROMPT_DIRTY="$char_x"
ZSH_THEME_GIT_PROMPT_CLEAN=""


setopt prompt_subst


#replace ohmyzsh function cause it's slow
#function git_prompt_info() {
#  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
#    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
#}

function git_sha {
  local sha=$( git log -n 1 2> /dev/null | grep commit | awk {'print $2'} )
  echo ${sha:0:7}
}

function git_branch { git branch --list --no-color | grep "*" | awk '{print $2}' }

function short_git_info { echo $( git_prompt_info )| sed "s/^git:(//" | sed "s/)//"  }

function my_fast_git_prompt {
  git log -n 1 1>/dev/null 2> /dev/null
  if [ $? -eq 0 ] ; then
    local sha=$( git_sha )
    echo "($( git_branch ):$( git_sha ))"
  else
    echo ""
  fi
}



function my_git_promt {
  PROMPT_INFO=$( git_prompt_info )
  SHORT_INFO=$( short_git_info $PROMPT_INFO )
  if $( echo PROMPT_INFO | grep -q $char_x) ; then
    COLOR="$RED"
  else
    COLOR=""
  fi

  if [ -z "$SHORT_INFO" ] ; then
    echo ""
  else
    echo "($(git_prompt_short_sha)|%{$COLOR%}$SHORT_INFO%{$reset_color%}$(git_prompt_status)$(git_remote_status))"
  fi
}

function my_git_promt_mini {
  PROMPT_INFO=$( git_prompt_info )
  SHORT_INFO=$( short_git_info $PROMPT_INFO )
  if $( echo PROMPT_INFO | grep -q $char_x) ; then
    COLOR="$RED"
  else
    COLOR=""
  fi

  echo "($(git_prompt_short_sha)|%{$COLOR%}$SHORT_INFO%{$reset_color%})"
}

function ruby_version { echo $( rvm_prompt_info || rbenv_prompt_info 2> /dev/null || ruby -v 2> /dev/null || echo "why no ruby"   ) 2> /dev/null  }

function hostname_color {
  if [ -z "$HOSTNAME_COLOR" ]; then
      echo "$PINK"
  else
      echo "$( color256 $HOSTNAME_COLOR )"
  fi
}
#MINIMAL_PROMPT=true
if ! [ -z "$MINIMAL_PROMPT" ] ; then
  PROMPT=$'
$( my_fast_git_prompt )
$SALMON%n%{$reset_color%}@%{$(hostname_color)%}%m$RESET: $CBLUE$PWD
%(?,$GREEN,$RED)$%{$RESET%} '

else
  PROMPT=$'
$(my_git_promt) $(ruby_version)
$SALMON%n%{$reset_color%}@%{$(hostname_color)%}%m$RESET: $CBLUE$PWD
%(?,$GREEN,$RED)$%{$RESET%} '
fi


