# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/.env_vars ]; then
  . ~/.local/.env_vars
fi


# User specific environment and startup programs

#export PATH=$PATH:$HOME/bin:/usr/java/jdk1.6.0_22/bin:/opt/apache-maven-2.2.1/bin

export EDITOR=vim
#. /etc/profile.d/java.sh

