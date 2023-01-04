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

# symlink dotfiles (adapted from coder default script)
echo "Symlinking dotfiles"
for dotfile in "$(pwd)/".*; do
  # Skip Git related
  if [[ $dotfile =~ \.git$ ]]; then
    echo "not linking .git"
    continue
  fi
  if [[ $dotfile =~ \.gitignore$ ]]; then
    echo "not linking .gitignore"
    continue
  fi
  if [[ $dotfile =~ \.gitattributes$ ]]; then
    echo "not linking .gitattributes"
    continue
  fi
  if [[ $dotfile =~ \.github$ ]]; then
    echo "not linking .github"
    continue
  fi

  echo "Symlinking $dotfile"
  ln -sf "$dotfile" "$HOME"
done
