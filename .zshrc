# cat .zshrc | grep -vE "^#|^$"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ZSH_THEME="mytheme"
plugins=(git timer history zsh-interactive-cd)
source $ZSH/oh-my-zsh.sh
