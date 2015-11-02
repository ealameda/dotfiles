. "$HOME/.bashrc"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# export CC=gcc-4.2.1
export CDPATH=.:~:~/Code
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
PATH=$PATH:/usr/local/mysql/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
export ANDROID_HOME=/usr/local/opt/android-sdk
[[ -r $rvm_path/scripts/completion ]] && source $rvm_path/scripts/completion

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
