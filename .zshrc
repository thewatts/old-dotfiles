#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

alias zues='zeus'
alias WEEMA='bake db:drop && bake db:create && bake db:migrate'
alias WEEMATEST='RAILS_ENV=test rake db:drop && RAILS_ENV=test rake db:create && RAILS_ENV=test rake db:migrate'
alias kode='cd ~/code/'
alias kts='tmux ls | awk '\''{print $1}'\'' | sed '\''s/://g'\'' | xargs -I{} tmux kill-session -t {}'
alias rdb='bake db:migrate && bake db:test:prepare'
alias work='thyme -d'
alias revolt='thyme -s'
alias more='thyme -dm'
alias rest='thyme -db'
alias bake='bundle exec rake'
alias buard='bundle exec guard'
alias list='ps aux | grep'
alias rist='bake routes | grep'
alias springer='spring stop && spring start'

export PATH=/usr/local/bin:/usr/local/sbin:~/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

## npm binaries
export PATH=/usr/local/share/npm/bin:$PATH

## GO
# export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/code/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$GOPATH/bin:$PATH

### RVM
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Tmux 256 color forcing:
#http://www.terminally-incoherent.com/blog/2012/10/17/vim-solarized-and-tmux/
export TERM="screen-256color"
export BUNDLER_EDITOR=vim
alias tmux="tmux -2"

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#source ~/.rvm/scripts/rvm

# Guard
export GUARD_NOTIFY='false'

# RBENV
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/lib/node:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

# RBEnv
if (( $+commands[rbenv] )) ; then
  eval "$(rbenv init --no-rehash -)"
  (rbenv rehash &) 2> /dev/null
fi
