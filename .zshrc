eval "$(rbenv init -)"
source $HOME/.cargo/env

eval "$(starship init zsh)"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
