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
  cp .bash_profile ~/.zprofile
  cp .vimrc ~/.vimrc

  if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
    echo 'installing vim-plug for vim magic'
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi
  vim +PlugInstall +qall

  if [ ! -f "$HOME/.vim/bundle/Vundle.vim" ]; then
    echo 'installing Vundle plugins for vim'
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  fi
  vim +PluginInstall +qall
}

function setup_git_aliases() {
  echo 'creating git aliases'
  cp .gitconfig ~/.gitconfig
}

setup_homebrew
setup_dotfiles
setup_git_aliases
