
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
alias start-namely="foreman start -f Procfile.dev"

export NVM_DIR="/Users/nickhehr/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
alias screen="/usr/local/Cellar/screen"
alias screen="/usr/local/bin/screen-4.5.1"

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

refresh_branch() {
  git br -D $1; 
  git fetch ${2:-upstream} $1:$1;
}

export -f refresh_branch

delete_branch_with() {
  git branch -d $(git br | grep $1);
}

export -f delete_branch_with

checkout_branch_with() {
  git checkout $(git br | grep $1);
}

export -f checkout_branch_with

watch_pod() {
  watch -cd "kubectl get pods | grep $1";
}

export -f watch_pod

delete_pod() {
  kubectl delete pod --now $1;
}

helm_update_values() {
  sed -i "" -E "s/tag: (.*)/tag: \"$1\"/" ~/charts/namely/values.yaml;
  sed -i "" -E "s/assetsVersion: (.*)/assetsVersion: \"$2\"/" ~/charts/namely/values.yaml;
  sed -i "" -E "s/assetsVersion: (.*)/assetsVersion: \"$2\"/" ~/charts/hcm/values.yaml;
  sed -i "" -E "s/assetsVersion: (.*)/assetsVersion: \"$2\"/" ~/charts/bifrost/values.yaml;
  cd ~/charts && helm dependency update namely && cd -;
  echo "The values have been updated and charts have been built!"
}

helm_deploy() {
  helm install namely --name=$1;
}

export -f helm_deploy

export -f helm_update_values


# eval $(docker-machine env default)

docker_exec() { 
  local name=$1
  shift
  docker exec -ti $(docker ps -f name=$name -q) "$@"
}

export -f docker_exec

export DOCKER_API_VERSION=1.23
export KUBECONFIG=/Users/nickhehr/.kube/config
export TILLER_NAMESPACE=default

generate_rails_tags() {
  echo "Generating tags...";
  ctags --verbose --tag-relative -Rf.git/tags --exclude=.git --exclude=tmp --exclude=public --exclude=app/assets --exclude=assets --exclude=node_modules --exclude=.gulp --languages=ruby `bundle list --paths` $MY_RUBY_HOME . && echo "Tag generation complete!";
}

export -f generate_rails_tags

# ================ Kube aliases ====================
# alias kb="kubectl --kubeconfig='/Users/jonmohrbacher/kube/dev-kube/kubeconfig'"
function getpod {
  kubectl --kubeconfig=/Users/jonmohrbacher/kube/dev-kube/kubeconfig --namespace=$1 get pods | grep $2 | head -n 1 | awk '{ print $1 }'
}
export PATH="/usr/local/sbin:$PATH"

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$HOME/.yarn/bin:$PATH"

export FZF_DEFAULT_COMMAND='rg --files'

export PLATFORM="$HOME/platform"
