# squarism.zsh-theme
#
# Author: Chris Dillon
# URL: http://squarism.com/
# Repo: https://github.com/squarism/dotfiles
# Direct Link: https://raw.githubusercontent.com/squarism/dotfiles/master/squarism.zsh-theme
# Ripoff of: af-magic by Andy Fleming

# color definitions
eval base_color='$FG[255]'
eval muted_color='$FG[241]'
eval bright_color='$FG[214]'
eval highlight_color='$FG[033]'
eval special_color='$FG[222]'
eval error_color=$fg[red]

# prompt template
PROMPT='$bright_color%m$muted_color|$base_color%2~\
$(git_prompt_info) \
$highlight%(!.#.>)%{$reset_color%} '

# git prompt template
ZSH_THEME_GIT_PROMPT_PREFIX="$special_color(branch:"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$bright_color*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$special_color)%{$reset_color%}"
