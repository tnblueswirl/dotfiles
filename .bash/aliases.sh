# aliases go here, e.g.
# alias g='git'

# CONVENIENCE SHORTCUTS
alias armorlog='. ~/.dotfiles/myscripts/armorlog.sh 0'
alias darkbkgnd="source ~/.dotfiles/myscripts/darkbkgnd.sh ; export ITERM_PROFILE='Solarized Dark'"
alias gitlog='git log --graph --oneline --decorate --all'
alias gittags='git tag -l | sort -V'
alias irb='irb --simple-prompt'
alias lchrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --allow-insecure-localhost'
alias lightbkgnd="source ~/.dotfiles/myscripts/lightbkgnd.sh ; export ITERM_PROFILE='Solarized Light'"
alias onedark="export DIRC='tput setaf 170'"
alias solarlight="source ~/.dotfiles/myscripts/lightbkgnd.sh ; export ITERM_PROFILE='Solar Light 256'"
alias solardark="source ~/.dotfiles/myscripts/darkbkgnd.sh ; export ITERM_PROFILE='Solar Dark 256'"
alias toggle_solarized='source ~/.dotfiles/myscripts/toggle_solarized.sh'
# alias nvimbranch is defined in `functions.sh`
# alias vimbranch is defined in `functions.sh`
alias nvimdfm='nvim $(git dfm --name-only)'
alias nvimselect='select session in $(ls -1 | grep -E "Session.*\.vim") ; do nvim -S "$session" ; break ; done'
alias vimselect='select session in $(ls -1 | grep -E "Session.*\.vim") ; do vim -S "$session" ; break ; done'

if [ $(uname 2> /dev/null | grep Linux) ]; then
  alias ll='ls -lAhF --color=auto'
  alias lls='ls -FA1 --color=auto'
else
  alias ll='ls -lAhGF'
  alias lls='ls -FGA1'
fi

alias lll='ls -lAhGF | less'
alias turnoffipv6="networksetup -setv6off Wi-Fi"
alias turnonipv6="networksetup -setv6automatic Wi-Fi"

# REDEFINING COMMANDS TO AVOID PROBLEMS AND ADD OPTIONS
alias cp='cp -i'
alias df='df -H'
alias du='du -h'
alias grep='grep --color=auto'
alias ln='ln -i'
alias mkdir='mkdir -p'
alias mv='mv -i'
alias nano='nano -z'
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'
alias rm='rm -i'
alias tmux='tmux -2'
alias tree='tree -CF'
alias tree-nopyc='tree -CFI "*.pyc"'
alias vimdiff='nvim -d'
alias webphantomjs='phantomjs --webdriver=4444'
if [ -e /Applications/MAMP/Library/bin/mysql ]; then
  alias mysql='/Applications/MAMP/Library/bin/mysql -u root -p'
fi

# WORK ALIASES
alias artisan='php artisan'
alias composer='COMPOSER_MEMORY_LIMIT=-1 composer'
alias npmprodbuild='NODE_ENV=production NODE_OPTIONS="--max-old-space-size=4096" npm run build'
alias qlisten='php artisan queue:listen --tries=1 --timeout=600'
alias qwork='php artisan queue:work --tries=1 --timeout=600'
alias showlinks="ls -lA node_modules/ | grep '^l' | sed -l 's/.*\/\(.*\)$/\1/'"
alias tinker='php artisan tinker'
alias updateapp='rm -rf node_modules package-lock.json && composer update cccisd/*'

# TESTING ALIASES
# alias apitest='php lib/vendor/managed-packages/bin/codecept run api'
# alias browsertest='console/acceptance/acceptance.sh'
# alias browsertestchrome='console/func_tests_chrome.sh'
# alias browsertestsafari='console/func_tests_safari.sh'
# alias buildtests='php lib/vendor/managed-packages/bin/codecept build'
# alias codeception='php lib/vendor/managed-packages/bin/codecept run'
# alias cover='lib/vendor/managed-packages/phpunit/phpunit/phpunit -c tests/data/phpunit.coverage.xml tests'
# alias covertests='lib/vendor/managed-packages/phpunit/phpunit/phpunit -c tests/data/phpunit.coverage.xml tests; console/copy_coverage_results'
# alias testall='unit tests; apitest; browsertestchrome'
# alias unit='lib/vendor/managed-packages/phpunit/phpunit/phpunit -c tests/data/phpunit.xml'
alias unit='vendor/phpunit/phpunit/phpunit -c phpunit.xml'

# PERSONAL SCRIPT ALIASES
alias findall='. ~/.dotfiles/myscripts/find_all.sh'
alias phplocations='. ~/.dotfiles/myscripts/php_locations.sh'

# TMUX HELPER
alias smart_cls=' clear && tmux clear-history 2> /dev/null'
if ! command -v clear 2>&1 >/dev/null && command -v reset 2>&1 >/dev/null ; then
  alias smart_cls=' reset && tmux clear-history 2> /dev/null'
fi
