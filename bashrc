#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '


export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
export HISTSIZE=100
export HISTFILESIZE=1000

export EDITOR=vim

alias ls='ls --color=auto'
alias cls='clear'

# List user installed packages
alias pkgs='comm -23 <(pacman -Qeq|sort) <(pacman -Qgq base base-devel|sort)'

