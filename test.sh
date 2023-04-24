#!/bin/zsh
set -Eeuvo pipefail

# Setup shell
./install.sh
source .zshrc

# Smoke tests

type cddot

# Check that .gitconfig is configured for `autoSetupRemote`
grep "autoSetupRemote = true" $HOME/.gitconfig
grep "autoSetupRemote = true" $HOME/.gitconfig
