local ret_status="%(?:%{$fg_bold[green]%}❯ :%{$fg_bold[red]%}❯ %{$reset_color%})"
PROMPT='
%{$fg[cyan]%}%~%{$FG[251]%}$(git_prompt_ahead)$(git_prompt_info)%{$reset_color%} $(virtualenv_prompt_info)
${ret_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_AHEAD="%{$reset_color%}%{$FG[214]%}"
