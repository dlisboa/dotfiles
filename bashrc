eval "$(rbenv init -)"
eval "$(direnv hook bash)"

alias ls='ls --color=auto'
alias ll='ls -l'
alias vi='vim'
alias vim='nvim'
alias gl='git l'
alias gll='git ll'
alias be='bundle exec'

export EDITOR=vim
export PS1="\h:\W\$ "
