#!/bin/zsh
set -Eeuvo pipefail

# Set Coder-specific environment variables
CODER_SSH_PUBKEY=$HOME/.ssh/coder.pub
touch $CODER_SSH_PUBKEY
export CODER_USER_EMAIL="foo.bar@baz.com"

# Setup shell
./install.sh
source $HOME/.zshrc

# Smoke tests

# Test aliases
type awsint
type cdag
type cdcli
type cddock

# Check that GOPATH is set
echo $GOPATH

# Check that .gitconfig is configured for Lacework
grep "$CODER_SSH_PUBKEY" $HOME/.gitconfig
grep "$CODER_USER_EMAIL" $HOME/.gitconfig
