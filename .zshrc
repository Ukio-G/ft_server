# Path to your oh-my-zsh installation.
export ZSH="/root/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="oxide"

source $ZSH/oh-my-zsh.sh


plugins=(git)
autoload -Uz zkbd
[[ ! -f ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE} ]] && zkbd
source  ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}

[[ -n $key[Up]   ]] && bindkey -- $key[Up]   history-beginning-search-backward
[[ -n $key[Down] ]] && bindkey -- $key[Down] history-beginning-search-forward
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char


git config --global user.email "atawana@21-school.ru"
git config --global user.name "Aracely Tawana"

