#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

source /usr/share/chruby/chruby.sh
eval "$(direnv hook bash)"

export TERM=xterm-256color
export EDITOR=vim

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;146m'

alias ll='ls -l'
alias vi='vim'
alias gl='git l'
alias gll='git ll'
alias be='bundle exec'

source /usr/share/git/completion/git-prompt.sh
export PS1="\h:\W \$ "
white="\[\e[01;37m\]"
none="\[\e[0m\]"
blue="\[\e[01;34m\]"
green="\[\e[01;32m\]"
# export PS1="$white\h$none:$blue\W$green$(__git_ps1)$none \$ "
export PS1="$white\h$none:$blue\W$green$none \$ "
