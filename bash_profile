. "$HOME/.bashrc"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export CC=gcc-4.2
export CDPATH=.:~:~/Code

PATH=$PATH:/usr/local/mysql/bin

[[ -r $rvm_path/scripts/completion ]] && source $rvm_path/scripts/completion

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
