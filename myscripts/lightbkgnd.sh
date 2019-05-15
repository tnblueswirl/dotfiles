export GITC='tput setaf 239'
if [ -n "$ITERM_PROFILE" ]; then
  export ITERM_PROFILE="$(echo "$ITERM_PROFILE" | sed -e 's/[Dd]ark/light/')"
fi
