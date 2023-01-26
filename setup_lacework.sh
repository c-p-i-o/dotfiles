#!/bin/zsh

# setup work directories
echo "Setting up work directories"
mkdir -p $HOME/lwcode/src/github.com/lacework/agent
mkdir -p $HOME/lwcode/src/github.com/lacework-dev

# set GOPATH
echo "Setting GOPATH to HOME/lwcode"
export GOPATH=$HOME/lwcode
