# Based on evan's prompt
# Shows the exit status of the last command if non-zero
# Uses "#" instead of "»" when running with elevated privileges

function my_git_prompt_info() {
    local branch_color=$(parse_git_dirty)
    [ $(git_current_branch) ] && echo "[%{${fg_bold[${branch_color}]}%}$(current_branch)%{${reset_color}%}]"
}

function my_git_prompt_status() {
    local branch_color=$(parse_git_dirty)
    [ $(git_current_branch) ] && echo "[%{${fg_bold[${branch_color}]}%}$(current_branch)%{${reset_color}%} $(git_prompt_status)]"
}

autoload -U colors
colors

() {
    local color_user="$FG[220]"
    if [ $USER = "root" ]; then
        local color_user="$fg_bold[magenta]"
    fi
    prompt_user="%{${color_user}%}%n%{${reset_color}%}"

    local color_host="$FG[220]"
    prompt_host="%{${color_host}%}%m%{${reset_color}%}"

    local color_dir="$fg_bold[cyan]"
    prompt_dir="%{${color_dir}%}%~%{${reset_color}%}"
}

PROMPT='${prompt_user}@${prompt_host}:${prompt_dir} $(my_git_prompt_info)
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

