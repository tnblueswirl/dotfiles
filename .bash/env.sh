# environment variable exports go here, e.g.
# export ENV_VARIABLE='foo'

# SETTING ENVIORNMENT VARIABLES
# export LESS='-M'
# NOTE: PATH is altered elsewhere, updating here could result in duplications)

if [[ -z "$ITERM_PROFILE" ]] && \
  [[ "$TERM_PROGRAM" == "Apple_Terminal" ]]
then
  # This file is processed after aliases.sh, `solarlight` is defined there
  solarlight
fi

if command -v fzf 2>&1 >/dev/null && command -v bat 2>&1 >/dev/null ; then
  _PREVIEW='bat --theme="Solarized (dark)" --italic-text=always --color=always --style=header,grid,numbers --line-range :300 {} 2> /dev/null'
  _FZF_BINDINGS="--bind='ctrl-p:preview-page-up' --bind='ctrl-n:preview-page-down'"
  FZF_DEFAULT_OPTS="--ansi ${_FZF_BINDINGS} --preview-window 'right:60%' --preview '${_PREVIEW}'"
  export FZF_DEFAULT_OPTS
  unset _PREVIEW
  unset _FZF_BINDINGS
fi

export LSCOLORS=exfxcxdxbxegedabagacad

# Let bash know we want to use NeoVim for everything!
EDITOR="nvim"
export EDITOR

if [ -f ~/Library/Preferences/WebIde100/phpstorm.vmoptions ]; then
  WEBIDE_VM_OPTIONS=$HOME/Library/Preferences/WebIde100/phpstorm.vmoptions
  export WEBIDE_VM_OPTIONS
fi
