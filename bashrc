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

alias cls='clear'
alias ls='ls --color=auto'
alias la='ls -AF'
alias ll='la -lh'
alias pkgs='comm -23 <(pacman -Qeq|sort) <(pacman -Qgq base base-devel|sort)'
alias sudo='sudo '

# Playing with Rust
export LD_LIBRARY_PATH=:/usr/local/lib
alias rustup='curl -s https://static.rust-lang.org/rustup.sh | sh'

