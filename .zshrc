# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.zsh_custom


test -f ~/.profile && source ~/.profile
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dustin2"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rvm rails ruby)

source $ZSH/oh-my-zsh.sh

#source /etc/profile.d/rvm.sh
#rvm
if [ -f ~/.rvm/scripts/rvm ]; then
  source ~/.rvm/scripts/rvm
fi

#mac ports
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH 
#PATH=$PATH:$HOME/.local/bin
#homebrew
# export PATH=/usr/local/bin:$PATH
#
export PATH=$PATH:"$HOME/.bin"

if [ -f ~/.alias ]; then
  . ~/.alias
fi

unamestr=$( uname -s )
if [[ "$unamestr" == 'Linux' ]] && test -f ~/.linux_specific ; then
    . ~/.linux_specific
elif [[ "$unamestr" == 'Darwin' ]] && test -f ~/.mac_specific; then
    . ~/.mac_specific
elif echo "$unamestr" | egrep -q "CYGWIN" && test -f ~/.cygwin_specific; then
    . ~/.cygwin_specific
fi

unsetopt correct_all
unsetopt correct
setopt NO_BEEP

if [ -f ~/.profile ]; then
  . ~/.profile
fi
