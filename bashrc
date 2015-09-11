#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Colored man pages
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
        LESS_TERMCAP_md=$'\E[01;38;5;74m' \
        LESS_TERMCAP_me=$'\E[0m' \
        LESS_TERMCAP_se=$'\E[0m' \
        LESS_TERMCAP_so=$'\E[38;5;246m' \
        LESS_TERMCAP_ue=$'\E[0m' \
        LESS_TERMCAP_us=$'\E[04;38;5;146m' \
        man "$@"
}

export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
export HISTSIZE=100
export HISTFILESIZE=1000

export CC=clang
export CXX=clang++

export VISUAL=vim
export EDITOR="$VISUAL"

if [[ -x /usr/bin/dircolors ]]; then
    [[ -r ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

alias cls='clear'
alias grep='grep --color=auto'
alias ls='ls --color=auto --group-directories-first --file-type'
alias la='ls -A'
alias ll='la -lh'
alias pkgs='comm -23 <(pacman -Qeq|sort) <(pacman -Qgq base base-devel|sort)'
alias sudo='sudo '

complete -cf sudo

unset SSH_ASKPASS

# Playing with Rust
export LD_LIBRARY_PATH=:/usr/local/lib
alias rustup='curl -s https://static.rust-lang.org/rustup.sh | sh'
