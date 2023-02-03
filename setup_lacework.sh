#!/bin/zsh

# setup work directories
echo "Setting up work directories"
LACEWORK_DIR=$GOPATH/src/github.com/lacework
LACEWORK_DEV_DIR=$GOPATH/src/github.com/lacework-dev
mkdir -p $LACEWORK_DIR
mkdir -p $LACEWORK_DEV_DIR

# Lacework-specific git settings
CODER_SSH_PUBKEY=$HOME/.ssh/coder.pub
if [ -e "$CODER_SSH_PUBKEY" ]; then git config --global user.signingkey $CODER_SSH_PUBKEY; fi
if [ -z "$CODER_USER_EMAIL" ]; then git config --global user.email $CODER_USER_EMAIL; fi
