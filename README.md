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

## LunarVim setup

_Requires [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) to work_

1. Read [lunarvim installation instructions](https://www.lunarvim.org/01-installing.html#stable)
2. Copy `.config/lvim` directory to home
3. Run `lvim`
4. Install all treesitter and LSP configs
