#!/bin/zsh

# Set Coder-specific environment variables
export CODER_SSH_PUBKEY="$HOME/foobarbaz"
export CODER_USER_EMAIL="foo.bar@baz.com"

# Setup shell
./install.sh
source .zshrc

# Smoke tests

# Test aliases
type awsint
type cdag
type cdcli
type cddock

# Check that GOPATH is set
[[ -n $GOPATH ]] || (echo "GOPATH not set, FAIL" && false)
