export GITC='tput setaf 251'
if [[ -n "$ITERM_PROFILE" ]]; then
  export ITERM_PROFILE="$(echo "$ITERM_PROFILE" | sed -e 's/[Ll]ight/dark/')"
fi
