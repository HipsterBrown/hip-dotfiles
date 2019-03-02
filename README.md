# My Dev Setup

```sh
git clone https://github.com/hipsterbrown/hip-dotfiles
cd hip-dotfiles
chmod +x setup.sh
./setup.sh
```

- installs [Homebrew](https://brew.sh), if it's not installed already
- installs all formula and casks in the Brewfile 
- copies `.bash_profile` and `.vimrc` to the HOME directory
- installs Plug, if not installed already
- installs all Plug and Vundle dependencies for vim
- installs tmuxinator gem, if Ruby gems are available
