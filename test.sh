#!/bin/zsh

# Setup shell
./install.sh
source .zshrc

# Smoke tests

# Test aliases
type awsint
type cddot
type cdag
type cdcli
type cddock

# Check that GOPATH is set
[[ -n $GOPATH ]] || (echo "GOPATH not set, FAIL" && false)
