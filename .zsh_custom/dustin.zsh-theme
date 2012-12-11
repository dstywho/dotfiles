grey='\e[38;5;244m'
BLUE=$( printf "\e[38;5;117m")
PERIWINKLE=$( printf "\e[38;5;117m" )
PINK=$( printf "\e[38;5;177m")
PASTEL_GREEN=$( printf "\e[38;5;155m" )
DARK_RED=$( printf "\e[38;5;88m")
FUSIA="\e[38;5;199m"
SALMON="\e[38;5;216m"
NOCOLOR="\e[00m"


#ZSH_THEME_GIT_PROMPT_PREFIX="%{$grey%}("
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$grey%})%{$FUSIA%}dirty✗%{$reset_color%} "
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$grey%})"


setopt prompt_subst

ruby_version=$(rvm_prompt_info || rbenv_prompt_info || echo "unknown" )
PROMPT=$'
$(git_prompt_info)%{$DARK_RED%}$ruby_version 
%{$BLUE%}%n%{$reset_color%}@%{$PINK%}%m%{$reset_color%}:%{$PASTEL_GREEN%}$PWD
%(?,%{%F{green}%},%{%F{red}%})⚡%{$reset_color%} '
