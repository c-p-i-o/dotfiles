#!/bin/zsh

# install ohmyz.sh
echo "Installing ohmyz.sh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# install p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# copy dotfiles (adapted from coder default script)
echo "Copying dotfiles"
for dotfile in "$(pwd)/".*; do
  # Skip Git related
  if [[ $dotfile =~ \.git$ ]]; then
    echo "not copying .git"
    continue
  elif [[ $dotfile =~ \.gitignore$ ]]; then
    echo "not copying .gitignore"
    continue
  elif [[ $dotfile =~ \.gitattributes$ ]]; then
    echo "not copying .gitattributes"
    continue
  elif [[ $dotfile =~ \.github$ ]]; then
    echo "not copying .github"
    continue
  fi

  echo "Copying $dotfile"
  cp -r "$dotfile" "$HOME"
done

# Lacework-specific setup
./setup_lacework.sh
