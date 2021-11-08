# cndreisbach's bash prompt, heavily inspired by @gf3’s Sexy Bash Prompt

if ! [[ "$0" =~ "bash" ]]; then
  return
fi

function_exists() {
  test $(declare -f -F $1)
}

if [[ ${COLORTERM} = gnome-* && ${TERM} = xterm ]] && [[ $(infocmp gnome-256color 2> /dev/null) ]]; then
  export TERM=gnome-256color
elif [[ $(infocmp xterm-256color 2> /dev/null) ]]; then
  export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
  tput sgr0
  if [[ "${ITERM_PROFILE}" = 'One Dark' ]]; then
    DIRC="tput setaf 170"
  else
    DIRC="tput setaf 6"
  fi
  if [[ "${ITERM_PROFILE}" =~ [Ll]ight ]]; then
    GITC="tput setaf 239"
  else
    GITC="tput setaf 251"
  fi
  GITUNPUSHEDC="tput setaf 214"
  ERRORC="tput setaf 1"
  BOLD="tput bold"
  RESET="tput sgr0"
fi

export DIRC
export ERRORC
export GITC
export GITUNPUSHEDC
export BOLD
export RESET

function parse_git_dirty() {
  [[ $(git status 2> /dev/null | tail -n1) != *"nothing to commit"* ]] && \
  [[ $(git status 2> /dev/null | tail -n2) != *"nothing to commit"* ]] && \
  echo "*"
}

function parse_git_branch() {
  local git_branch
  git_branch=$(git branch --no-color 2> /dev/null \
    | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/")
  [[ -z ${git_branch} ]] || echo " ${git_branch}"
}

function parse_venv() {
  local venv=$(basename ${VIRTUAL_ENV} 2> /dev/null)
  [[ ${venv} != "" ]] && echo " (python:${venv})"
}

function set_title_bar() {
  case "${TERM}" in
  xterm*|rxvt*)
    echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"
    ;;
  *)
    ;;
  esac
}

function prompt_command() {
  # Add newline and (colorized) directory
  PS1="\n$(${DIRC})\w$(${RESET})"
  if [[ -z $(git cherry 2> /dev/null) ]]; then
    # If there are no unpushed commits, use the normal color
    PS1="${PS1}$(${GITC})"
  else
    # If there ARE unpushed commits, use the unpushed color
    PS1="${PS1}$(${GITUNPUSHEDC})"
  fi
  PS1="${PS1}\$(parse_git_branch)$(${RESET})\$(parse_venv)\n\$ "
  set_title_bar
}

function_exists update_terminal_cwd || update_terminal_cwd() { :; }

PROMPT_COMMAND="update_terminal_cwd;prompt_command"
PS2="- "
PS4="\$LINENO+ "
export PROMPT_COMMAND
export PS2
export PS4
