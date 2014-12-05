# Based on evan's prompt
# Shows the exit status of the last command if non-zero
# Uses "#" instead of "»" when running with elevated privileges

function my_git_prompt_info() {
	branch_color=$(parse_git_dirty)
	[ $(current_branch) ] && echo "[%{${fg_bold[${branch_color}]}%}$(current_branch)%{${reset_color}%}]"
}

function my_git_prompt_status() {
	branch_color=$(parse_git_dirty)
	[ $(current_branch) ] && echo "[%{${fg_bold[${branch_color}]}%}$(current_branch)%{${reset_color}%} $(git_prompt_status)]"
}

autoload -U colors
colors

COLOR_USER="$FG[012]"
if [ $USER = "root" ]; then
	COLOR_USER="$fg_bold[magenta]"
fi
PROMPT_USER="%{${COLOR_USER}%}%n%{${reset_color}%}"

COLOR_HOST="$FG[012]"
PROMPT_HOST="%{${COLOR_HOST}%}%m%{${reset_color}%}"

COLOR_DIR="$fg_bold[cyan]"
PROMPT_DIR="%{${COLOR_DIR}%}%~%{${reset_color}%}"

PROMPT='${PROMPT_USER}@${PROMPT_HOST}:${PROMPT_DIR} $(my_git_prompt_info)
%# %{${reset_color}%}'

ZSH_THEME_GIT_PROMPT_DIRTY="red"
ZSH_THEME_GIT_PROMPT_CLEAN="green"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_ADDED="%{${fg_bold[cyan]}%}+%{${reset_color}%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{${fg_bold[yellow]}%}*%{${reset_color}%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{${fg_bold[red]}%}x%{${reset_color}%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{${fg_bold[blue]}%}o%{${reset_color}%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{${fg_bold[magenta]}%}!%{${reset_color}%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{${fg_bold[grey]}%}?%{${reset_color}%}"

#RPROMPT='$(git_prompt_info) $(git_prompt_status)'
#RPROMPT='$(my_git_prompt)'
#RPROMPT='%1(v|[%{${fg_bold[yellow]}%}%1v%{${reset_color}%}]|)%{${reset_color}%}'

