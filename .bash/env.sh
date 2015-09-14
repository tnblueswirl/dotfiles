# environment variable exports go here, e.g.
# export ENV_VARIABLE='foo'

# SETTING ENVIORNMENT VARIABLES
export LESS='-M'
#export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

export HISTSIZE=2000				# 500 is default
#export HISTTIMEFORMAT='%b %d %I:%M %p '		# using strftime format
export HISTCONTROL=ignoreboth			# ignoredups:ignorespace
export HISTIGNORE="history:pwd:exit:df:ls:ls -la:ls -la:ll:ls -a"

# Customizing command line prompt
#export PS1="\W\n > "

# Specifying options grep should use by default
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="7;41"
