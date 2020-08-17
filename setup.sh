#!/bin/bash

set -euxo pipefail

function setup_homebrew() {
  if ! type brew 2> /dev/null; then
    echo 'installing brew'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
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
  cp .zshrc ~/.zshrc
  cp .zprofile ~/.zprofile
  cp .vimrc ~/.vimrc
  cp .tmux.conf ~/.tmux.conf

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

  echo 'installing config files'
  mkdir -p ~/.config/alacritty
  cp -r .config/ ~/.config/
}

function setup_git_aliases() {
  echo 'creating git aliases'
  cp .gitconfig ~/.gitconfig
}

function setup_node() {
  echo 'installing volta'
  curl https://get.volta.sh | bash
}

function setup_rust() {
  echo 'installing rust'
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

setup_homebrew
setup_dotfiles
setup_git_aliases
setup_node
setup_rust
