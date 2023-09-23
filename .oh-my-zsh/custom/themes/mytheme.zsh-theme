## plugin options
# timer
TIMER_FORMAT='\n\n[%d]'
TIMER_PRECISION=3

## prompt
# spectrum_ls
# 045 - light blue
# 046 - green
# 160 - red
# 226 - yellow
# 231 - white
# 255 - grey white

# defined in ohmyzsh/lib/theme-and-appearance.zsh
ZSH_THEME_GIT_PROMPT_PREFIX='%F{231}:%F{045}git%F{231}:%F{045}'
ZSH_THEME_GIT_PROMPT_DIRTY='%F{160}*'
ZSH_THEME_GIT_PROMPT_SUFFIX=''

PROMPT='%B%F{046}[%F{231}%t %F{046}] [ %F{226}%~$(git_prompt_info) %F{046}]
%F{160}>%b %F{255}'
