if type dircolors > /dev/null; then
    eval "$(dircolors -b)"
fi

# Assumes GNU diff
if [ "$(diff --version | sed -nre 's/[^0-9]+3\.([0-9]+)/\1/p')" -gt 3 ]; then
    alias diff="diff --color=auto"
fi

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias cd..="cd .."
alias cd...="cd ../.."

alias dh="df -h -xtmpfs -xdevtmpfs"

dkkillall() { local p=$(docker ps -q); if [[ -n $p ]]; then docker kill $p; fi }
dkstopall() { local p=$(docker ps -q); if [[ -n $p ]]; then docker stop $p; fi }
dkrmall()   { local p=$(docker ps -q); if [[ -n $p ]]; then docker rm   $p; fi }
dksh() {
    docker exec -it $1 /bin/bash
}

alias findpy="find -name '*.py'"

alias geditn="gedit --new-window"

alias gitthis="git init . && git add . && git commit -m 'Git some' | grep -v '^ create mode'"

alias ls="ls --color=auto --group-directories-first"
alias ll="ls -l --human-readable"
alias la="ls --almost-all"

alias mounth="mount | grep --color=never '^/'| sed -r 's/ (type|on) / /g' | column -t"

alias octave="octave --quiet"

alias reloadwl="sudo modprobe -r wl && sudo modprobe wl"

top() { tput smcup; top; tput rmcup; }

alias xo="xdg-open"

alias xsudo="xhost +si:localuser:root && sudo"

# vim: set et sts=4 sw=4 tw=120 ft=sh:
