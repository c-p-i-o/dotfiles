#!/bin/zsh

# set GOPATH
echo "Setting GOPATH to HOME/lwcode"
LACEWORK_CODE=lwcode
export GOPATH=$HOME/$LACEWORK_CODE

# setup work directories
echo "Setting up work directories"
LACEWORK_DIR=$GOPATH/src/github.com/lacework
LACEWORK_DEV_DIR=$GOPATH/src/github.com/lacework-dev
mkdir -p $LACEWORK_DIR
mkdir -p $LACEWORK_DEV_DIR
