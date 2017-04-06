# squarism.zsh-theme
#
# Author: Chris Dillon
# URL: http://squarism.com/
# Repo: https://github.com/squarism/dotfiles
# Direct Link: https://raw.githubusercontent.com/squarism/dotfiles/master/squarism.zsh-theme
# Ripoff of: af-magic by Andy Fleming
#
# Created on: Feb 17, 2013
# Last modified on: Apr 06, 2017

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# primary prompt
PROMPT='$FG[032]%2~\
$(git_prompt_info) \
$FG[105]%(!.#.$FG[208]>$FG[214]>)%{$reset_color%} '

RPS1='${return_code}'

# color vars
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075](branch:"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
