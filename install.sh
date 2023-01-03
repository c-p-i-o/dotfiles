#!/usr/bin/bash

echo "Installation script now running..."

# set GOPATH
echo 'Setting GOPATH to HOME'
export GOPATH=$HOME

# install zsh
echo "Installing zsh"
brew install zsh
sudo chsh -s $(which zsh)

# install ohmyz.sh
echo "Installing ohmyz.sh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# setup work directories
"Setting up work directories"
mkdir -p ~/src/github.com/lacework/agent

# symlink dotfiles (copied from coder default script)
echo "Symlinking dotfiles"
for dotfile in "$DOTFILES_CLONE_PATH/".*; do
  # Skip `..` and '.'
  [[ $dotfile =~ \.{1,2}$ ]] && continue
  # Skip Git related
  [[ $dotfile =~ \.git$ ]] && continue
  [[ $dotfile =~ \.gitignore$ ]] && continue
  [[ $dotfile =~ \.gitattributes$ ]] && continue

  echo "Symlinking $dotfile"
  ln -sf "$dotfile" "$HOME"
done

# launch zsh
echo "Launching zsh"
exec zsh -l
