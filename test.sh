#!/bin/zsh
set -Eeuvo pipefail

# Setup shell
./install.sh
source .zshrc

# Smoke tests

type cddot
