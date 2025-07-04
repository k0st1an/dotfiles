## plugin options
# timer
TIMER_FORMAT='\n\n[%d]'
TIMER_PRECISION=3

# defined in ohmyzsh/lib/theme-and-appearance.zsh
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

__is_remote() {
  if [[ $(uname) != "Darwin" ]]; then
    print -P '%F{white}| %F{blue}%n %F{yellow}at %F{blue}%m '
  fi
}

PROMPT='%B%F{green}%D{%a %m/%d %R %Z} $(__is_remote)%F{white}| %F{green}%~%f $(git_prompt_info)%f
%B%(!.#.$)%b '
