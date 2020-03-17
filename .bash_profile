parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

md() {
  if [[ -d $@ ]]; then
    echo "Error: directory $@ already exists.";
    false;
  else
    mkdir -p $@;
    if [[ $# -ne 1 ]]; then
      true;
    else
      cd $@;
    fi;
  fi;
}

export -f md

notify() {
  osascript -e "display notification \"$*\" with title \"👋 notify\""
}

export -f notify

# usage: load your local environment with a .env file or point to another file
# dotenv // load .env by default
# dotenv .env.staging // load the environment variables in .env.staging
dotenv() {
  export $(cat ${1:-.env} | xargs);
}

# dynamically generate branch completion list
_list_branch_completions() {
  COMPREPLY=($(compgen -W "$(git branch --list --sort=refname | tr -d '*')" "${COMP_WORDS[1]}"))
}

# usage: select a branch to change to, sorted alpha-numeric
change_branch() {
  if [[ $# -ge 1 ]]; then
    git checkout $1
  else
    PS3="What branch would you like to select? (0 to exit)"$'\n'""
    select branch in $(git branch --list --sort=refname | tr -d '*')
    do
      if [ -z $branch ]; then
        return
      else
        git checkout $branch
        return
      fi
    done
  fi
}

complete -F _list_branch_completions change_branch

export -f change_branch

# usage: interactive select for cleaning up old branches
delete_branch() {
  if [[ $# -ge 1 ]]; then
    git branch -D $1
  else
    PS3="What branch would you like to delete? (0 to exit)"$'\n'""
    select branch in $(git branch --list --sort=refname | tr -d '*')
    do
      if [ -z $branch ]; then
        return
      else
        git branch -D $branch
      fi
    done
  fi
}

complete -F _list_branch_completions delete_branch

export -f delete_branch

# usage: get the latest version of a branch from remote
# refresh_branch // will change to a temp branch, delete previous branch, pull latest from origin
# refresh_branch branch_name // will delete branch_name, pull latest branch_name from origin
# refresh_branch branch_name remote_name // will delete branch_name, pull latest branch_name from remote_name
refresh_branch() {
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  BRANCH=(${1:-$CURRENT_BRANCH})
  TEMP="temp-$BRANCH"
  BRANCH_LIST=$(git branch | tr -d "*" | xargs)

  if [[ $CURRENT_BRANCH == $BRANCH ]]; then
    if [[ ! $BRANCH_LIST =~ $TEMP ]]; then
      git branch $TEMP
    fi

    git checkout $TEMP
  fi

  git branch -D $BRANCH
  git fetch ${2:-origin} $BRANCH:$BRANCH

  if [[ $CURRENT_BRANCH == $BRANCH ]]; then
    git checkout $BRANCH
  fi
}

complete -F _list_branch_completions refresh_branch

export -f refresh_branch

push_branch() {
  git push origin HEAD "$@"
}

export -f push_branch

generate_rails_tags() {
  echo "Generating tags...";
  ctags --verbose --tag-relative -Rf.git/tags --exclude=.git --exclude=tmp --exclude=public --exclude=app/assets --exclude=assets --exclude=node_modules --exclude=.gulp --languages=ruby `bundle list --paths` $MY_RUBY_HOME . && echo "Tag generation complete!";
}

export -f generate_rails_tags

# [ -f ~/.bashrc ] && source ~/.bashrc
[ -f ~/.bin/tmuxinator.bash ] && source ~/.bin/tmuxinator.bash

export PATH="/usr/local/sbin:$PATH"

export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

export EDITOR='vim'

export PATH="$HOME/.cargo/bin:$PATH"
# export PATH="$HOME/.nodenv/versions/8.15.1/bin:$PATH"

export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --glob "!.git/*"'
