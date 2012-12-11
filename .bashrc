#COLORS
test -f ~/.colors && . ~/.colors

test -f ~/.profile && source ~/.profile


set bell-style visible
function __common_vars() {
  export EDITOR=vim
  export SVN_EDITOR=vim
}

function __common_aliases(){
  alias githist="git log --graph --full-history --all --pretty=format:\"%h%x09%d%x20%s\""
  alias startXephyr="DISPLAY=:0.0; Xephyr -ac -screen 1280x1024 -br -reset 2> /dev/null :1"
}

function __mac_vars() {
  export CLICOLOR=1
  export LSCOLORS="exgxbxdxcxegedxbxgxcxd"
}

function __mac_aliases() {
  alias ls="ls -G"
  alias port="sudo port"
  alias grep="grep --color=auto"
}

function __set_mac_customizations(){
  __mac_vars
  __mac_aliases
}

function __linux_vars() {
  export TERM='xterm-256color'
}

function __linux_aliases() {
  alias vi='vim'
  alias ls='ls --color=auto'
  alias grep='grep --color=always'
  alias xclip="xclip -sel clip"
}

function __set_linux_customizations(){
  __linux_vars
  __linux_aliases
}


test -f ~/.alias && . ~/.alias
__common_vars

unamestr=$( uname -s )
if [[ "$unamestr" == 'Linux' ]]; then
  __set_linux_customizations
elif [[ "$unamestr" == 'Darwin' ]]; then
  __set_mac_customizations
elif $unamestr | egrep -q "CYGWIN"; then
  echo 'cygwin stuff not defined'
fi


#screen title
if [ -n "$TERMCAP" ]; then
    #SCREENTITLE='\[\ek\h:\w:\033\e\\\]'
    CMD=$( echo $0 | sed -e 's/^\(\w*\|\/\)*\///g' )
    SCREENTITLE="\[\ek\e\\\]"
else
    SCREENTITLE=''
fi

function color_escape () {
  echo "\[$1\]"
}

export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
if [[ "$TERM" = *256* ]] ; then
  if [ -z "$HOSTNAME_COLOR" ]; then
      HOSTNAME_COLOR_CODE="$PINK"
  else
      HOSTNAME_COLOR_CODE="$( color256 $HOSTNAME_COLOR )"
  fi
  export PS1="\n$(color_escape $BROWN)\u$(color_escape $NOCOLOR)@$(color_escape $HOSTNAME_COLOR_CODE)\h$(color_escape $NOCOLOR):$(color_escape $BLUE)\w  \n$(color_escape $NOCOLOR)\$ "
else
	PS1='\n\u@\h:\w \n$'
fi



PATH=$PATH:$HOME/bin/git-tf-1.0.1.20120827
PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/.bin
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#source ~/.rvm/scripts/rvm

