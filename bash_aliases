if type dircolors > /dev/null; then
    eval "$(dircolors -b)"
fi

# Assumes GNU diff
if [ "$(diff --version | sed -nre 's/[^0-9]+3\.([0-9]+)/\1/p')" -gt 3 ]; then
    alias diff="diff --color=auto"
fi

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias cd..="cd .."
alias cd...="cd ../.."

alias dh="df -h -xtmpfs -xdevtmpfs"

alias findpy="find -name '*.py'"

alias geditn="gedit --new-window"

alias gitthis="git init . && git add . && git commit -m 'Git some' | grep -v '^ create mode'"

alias ll="ls -l --human-readable --group-directories-first"
alias la="ls --almost-all --group-directories-first"
alias l="ls --group-directories-first"

alias mounth="mount | grep --color=never '^/'| sed -r 's/ (type|on) / /g' | column -t"

alias octave="octave --quiet"

alias reloadwl="sudo modprobe -r wl && sudo modprobe wl"

alias xo="xdg-open"

# vim: set et sts=4 sw=4 tw=120 ft=sh:
