# My Dev Setup

```sh
git clone https://github.com/hipsterbrown/hip-dotfiles
cd hip-dotfiles
chmod +x setup.sh
./setup.sh
```

- installs [Homebrew](https://brew.sh), if it's not installed already
- installs all formula and casks in the Brewfile
- copies `.zprofile`, `.zshrc`, `.tmux.confg`, and `.vimrc` to the HOME directory
- installs Vundle and Plug, if not installed already
- installs all Plug and Vundle dependencies for vim
- copies `.gitconfig` into the HOME directory
- installs [Volta](https://volta.sh/) for easy NodeJS version management
- installs [`rust`](https://rustup.rs/)

Emacs install

https://github.com/d12frosted/homebrew-emacs-plus#about

```shell
brew reinstall emacs --HEAD --use-git-head --with-cocoa --with-gnutls --with-rsvg --with-imagemagick
```

https://github.com/jmfurlott/config

**Doom emacs**
https://github.com/hlissner/doom-emacs#install

```shell
cp -r .doom.d ~/
```

TODO: Update the Brewfile with emacs installation and setup.sh with `doom-emacs` install script.
