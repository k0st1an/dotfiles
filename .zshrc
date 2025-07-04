# cat .zshrc | grep -vE "^#|^$"

ZSH_THEME="mytheme"
plugins=(git timer history zsh-interactive-cd fzf common-aliases)
source $ZSH/oh-my-zsh.sh
alias flusdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
bindkey "^[[1;5F" forward-word
bindkey "^[[1;5H" backward-word
PAGER='cat'
LANG="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_ALL="en_US.UTF-8"
export PATH='/Users/k0st1an/bin:/Users/k0st1an/go/bin:/opt/homebrew/bin:'$PATH
