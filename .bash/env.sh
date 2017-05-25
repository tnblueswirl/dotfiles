# environment variable exports go here, e.g.
# export ENV_VARIABLE='foo'

# SETTING ENVIORNMENT VARIABLES
# export LESS='-M'
#export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

# Customizing command line prompt
#export PS1="\W\n > "

# Specifying options grep should use by default
# export GREP_COLOR="7;41"

if [ -f ~/Library/Preferences/WebIde100/phpstorm.vmoptions ]; then
  WEBIDE_VM_OPTIONS=$HOME/Library/Preferences/WebIde100/phpstorm.vmoptions
  export WEBIDE_VM_OPTIONS
fi
