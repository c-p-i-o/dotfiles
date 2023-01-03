#!/bin/zsh

echo "Installation script now running with shell $(readlink -f /proc/$$/exe)..."

# set GOPATH
echo "Setting GOPATH to HOME"
export GOPATH=$HOME

# install ohmyz.sh
echo "Installing ohmyz.sh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# setup work directories
echo "Setting up work directories"
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
  [[ $dotfile =~ \.github$ ]] && continue
  [[ $dotfile =~ README.md$ ]] && continue

  echo "Symlinking $dotfile"
  ln -sf "$dotfile" "$HOME"
done
