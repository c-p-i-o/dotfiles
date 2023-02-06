#!/bin/zsh
set -Eeuo pipefail

# Setup shell
./install.sh
source .zshrc

# Smoke tests

type cddot
