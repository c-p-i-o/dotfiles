#!/bin/zsh

# first setup Lacework-specific profile (needed for $GOPATH)
source .lacework_profile

# setup work directories
echo "Setting up work directories"
LACEWORK_DIR=$GOPATH/src/github.com/lacework
LACEWORK_DEV_DIR=$GOPATH/src/github.com/lacework-dev
mkdir -p $LACEWORK_DIR
mkdir -p $LACEWORK_DEV_DIR

# Lacework-specific git settings
CODER_SSH_PUBKEY=$HOME/.ssh/coder.pub
if [[ -e "$CODER_SSH_PUBKEY" ]]; then git config --global user.signingkey $CODER_SSH_PUBKEY; fi
if [[ -v CODER_USER_EMAIL ]]; then git config --global user.email $CODER_USER_EMAIL; fi

# Use pinned version of Terraform for some Lacework-specific infra
TFENV=tfenv
if PATH="$(brew --prefix)/bin:$PATH"; command -v $TFENV > /dev/null 2>&1; then
    PATH="$(brew --prefix)/bin:$PATH"; $TFENV use v1.0.11
    echo "Using Terraform CLI v1.0.11"
else
    echo "$TFENV not found, not running $TFENV use v1.0.11"
fi

# Check that $GOPATH/bin is in PATH
echo $PATH | grep "lwcode"
