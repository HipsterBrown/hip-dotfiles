#!/bin/bash

set -euxo pipefail

function setup_homebrew() {
  if ! type brew 2> /dev/null; then
    echo 'installing brew'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  if [ -f "./Brewfile" ]; then
    # let's brew bundle from a special location
    echo 'installing packages from Brewfile'
    brew update
    brew bundle --file="./Brewfile"
  fi
}

function setup_dotfiles() {
  echo 'installing dotfiles'
  cp .bash_profile ~/.bash_profile
  cp .vimrc ~/.vimrc
  source ~/.bash_profile

  if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
    echo 'installing vim-plug for vim magic'
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall
  fi

  echo 'installing Vundle plugins for vim'
  vim +PluginInstall +qall
}

function install_tmuxinator() {
  if type gem 2> /dev/null; then
    echo 'installing tmuxinator from gem'
    gem install tmuxinator
  else
    echo 'need ruby gems to install tmuxinator'
  fi
}

setup_homebrew
setup_dotfiles
install_tmuxinator
