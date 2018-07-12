# ~/.bashrc: executed by bash(1) for non-login shells.
# See /usr/share/doc/bash/examples/startup-files (in bash-doc) for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Personal details used by e.g. git, hg, mercurial, debhelper
# NB: Each tool prefers its own env vars (e.g. DEBFULLNAME=..., DEBEMAIL=...)
#     or its own config files (e.g. ~/.gitconfig)
export NAME="Alex Willmer"
export EMAIL="alex@moreati.org.uk"

# Remove TTY flow control keys, aka why did my terminal just feeze?
stty stop ''            # Flow stop (default ctrl-s)
stty start ''           # Flow start (default ctrl-z)
stty -ixon
stty -ixoff

# Tab completion: ignore these suffixes
# NB _pycache__ is a slightly hacky way to match __pycache__
FIGNORE='.o:.pyc:.pyo:.pyd:_pycache__:.egg-info'

# Command history
shopt -s histappend
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkhash      # Check hashed commands exist before executing them
shopt -s checkwinsize   # Update $LINES and $COLUMNS after each command


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# To do 'paging as needed' git etc  LESS="-FRX", iif $LESS is not set.
# As a result setting LESS causes git output to always show in a full screen
# less session, unless an override is also set in .gitconfig.
# Display ANSI color escape sequences
# use smart case-sensitivity searches
export LESS="--RAW-CONTROL-CHARS --ignore-case"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


# Go will download to $GOPATH/src and install binaries to $GOPATH/bin
export GOPATH="$HOME/.local/go"

LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"

# NPM packages in homedir
NPM_PACKAGES="$HOME/.local/npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

unset MANPATH
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

function pathappend() {
    local dir="$1"
    if [[ ! $PATH =~ (^|:)$dir(:|$) ]]; then
        PATH+=":$dir"
    fi
}

pathappend "$HOME/.local/bin"
pathappend "$HOME/.cargo/bin"
pathappend "$NPM_PACKAGES/bin"

export PYTHONSTARTUP=~/.pythonrc

[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.liquidprompt/liquidprompt ] && . ~/.liquidprompt/liquidprompt
