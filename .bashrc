#COLORS
BROWN="\[\e[38;5;143m\]"
BLUE="\[\e[38;5;117m\]"
FUSIA="\[\e[38;5;170m\]"
SALMON="\[\e[38;5;216m\]"
NOCOLOR="\[\e[00m\]"
echo "bashrc"


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
  export TERM=xterm-256color
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

__common_vars

unamestr=$( uname -s )
echo $unamestr
if [[ "$unamestr" == 'Linux' ]]; then
  __set_linux_customizations
elif [[ "$unamestr" == 'Darwin' ]]; then
  __set_mac_customizations
elif $unamestr | egrep -q "CYGWIN"; then
  echo    
fi


#screen title
if [ -n "$TERMCAP" ]; then
    #SCREENTITLE='\[\ek\h:\w:\033\e\\\]'
    CMD=$( echo $0 | sed -e 's/^\(\w*\|\/\)*\///g' )
    SCREENTITLE="\[\ek\e\\\]"
else
    SCREENTITLE=''
fi

export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
if [[ "$TERM" = *256* ]] ; then
  export PS1="\n${BROWN}\u${BLUE}@${FUSIA}\h${NOCOLOR}:${BLUE}\w${SCREENTITLE}  \n${NOCOLOR}\$ "
else
	PS1='\n\u@\h:\w \n$'
fi



PATH=$PATH:$HOME/bin/git-tf-1.0.1.20120827
PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#source ~/.rvm/scripts/rvm

