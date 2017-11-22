#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -r /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

PS1='\[\e[1;34m\][\u@\h \w]\$\[\e[m\] '

export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
export HISTSIZE=100
export HISTFILESIZE=1000

export CC=clang
export CXX=clang++

export VISUAL=vim
export EDITOR="${VISUAL}"

if [[ -x /usr/bin/dircolors ]]; then
    [[ -r ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

alias cls='clear'
#alias pkgs='comm -23 <(pacman -Qeq|sort) <(pacman -Qgq base base-devel|sort)'
alias grep='grep --color=auto -I'
alias ls='ls --color=auto --group-directories-first --file-type'
alias la='ls -A'
alias ll='la -lh'
alias vim='nvim'
alias vi='nvim'

complete -cf sudo
stty -ixon
