# environment variable exports go here, e.g.
# export ENV_VARIABLE='foo'

# SETTING ENVIORNMENT VARIABLES
# export LESS='-M'
# NOTE: PATH is altered elsewhere, updating here could result in duplications)

# Let bash know we want to use Vim for everything!
EDITOR="vim"
export EDITOR

if [ -f ~/Library/Preferences/WebIde100/phpstorm.vmoptions ]; then
  WEBIDE_VM_OPTIONS=$HOME/Library/Preferences/WebIde100/phpstorm.vmoptions
  export WEBIDE_VM_OPTIONS
fi
