source ~/.aliases

# this is still too slow. fix it
[[ -s "$HOME/.zprezto/init.zsh" ]] && source "$HOME/.zprezto/init.zsh"

eval "$(rbenv init - --no-rehash zsh)"

#source ~/.rvm/scripts/rvm
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
