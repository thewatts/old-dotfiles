# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="doubleend"

# VI MODE
bindkey -v

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#alias go='git checkout '
alias zues='zeus'
alias WEEMA='rake db:drop && rake db:create && rake db:migrate'
alias kode='cd ~/code/'
alias kts='tmux ls | awk '\''{print $1}'\'' | sed '\''s/://g'\'' | xargs -I{} tmux kill-session -t {}'
alias rdb='rake db:migrate && rake db:migrate RAILS_ENV=test'
alias work='thyme -d'
alias revolt='thyme -s'
alias more='thyme -dm'
alias rest='thyme -db'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rspec sails ruby berks rvm vi-mode pip subl subl3 jsc tree)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:~/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

### Postgresql App
#export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
ctags=/usr/local/bin/ctags

## npm binaries
export PATH=/usr/local/share/npm/bin:$PATH

## GO
export PATH=$PATH:/usr/local/go/bin

### RVM
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Tmux 256 color forcing:
#http://www.terminally-incoherent.com/blog/2012/10/17/vim-solarized-and-tmux/
export TERM="screen-256color"
export BUNDLER_EDITOR=vim
alias tmux="tmux -2"

export GOPATH=$HOME/code/go
export PATH=$GOPATH/bin:$PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
source ~/.rvm/scripts/rvm
