#!/bin/zsh

# install ohmyz.sh
echo "Installing ohmyz.sh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# install p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# symlink dotfiles (adapted from coder default script)
echo "Symlinking dotfiles"
for dotfile in "$(pwd)/".*; do
  # Skip Git related
  if [[ $dotfile =~ \.git$ ]]; then
    echo "not linking .git"
    continue
  elif [[ $dotfile =~ \.gitignore$ ]]; then
    echo "not linking .gitignore"
    continue
  elif [[ $dotfile =~ \.gitattributes$ ]]; then
    echo "not linking .gitattributes"
    continue
  elif [[ $dotfile =~ \.github$ ]]; then
    echo "not linking .github"
    continue
  fi

  echo "Symlinking $dotfile"
  ln -sf "$dotfile" "$HOME"
done

# Lacework-specific setup
./setup_lacework.sh
