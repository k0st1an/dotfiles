# cat .zshrc | grep -vE "^#|^$"

ZSH_THEME="mytheme"
plugins=(git timer history zsh-interactive-cd)
source $ZSH/oh-my-zsh.sh
alias flusdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
bindkey "^[[1;5F" forward-word
bindkey "^[[1;5H" backward-word
PAGER='cat'
export PATH='/Users/k0st1an/bin:/Users/k0st1an/go/bin:/opt/homebrew/bin:'$PATH
