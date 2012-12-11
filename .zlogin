if [ -f ~/.profile ]; then
  . ~/.profile
fi

path+=$HOME/bin/git-tf-1.0.1.20120827
path+=$HOME/bin
path+=$HOME/.bin
path+=$HOME/.local/bin
path+=$HOME/.rvm/bin # Add RVM to PATH for scripting

