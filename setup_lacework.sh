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
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
if PATH="$(brew --prefix)/bin:$PATH"; command -v $TFENV > /dev/null 2>&1; then
    PATH="$(brew --prefix)/bin:$PATH"; $TFENV use v1.0.11
    echo "Using Terraform CLI v1.0.11"
else
    echo "$TFENV not found, not running $TFENV use v1.0.11"
fi

# Check that $GOPATH/bin is in PATH
echo $PATH | grep "lwcode"

# Add dependencies to build the agent (hopefully temporary)
sudo apt-get update && \
sudo apt-get install -y \
    bison \
    clang \
    flex \
    libcap-dev \
    libdbus-1-dev \
    libelf-dev \
    libmagic-dev \
    libmnl-dev \
    protobuf-compiler

if [ ! -d "/tmp/libpcap" ]; then git clone https://github.com/the-tcpdump-group/libpcap.git /tmp/libpcap; fi
mkdir -p /tmp/libpcap/build
cd /tmp/libpcap/build && cmake -DDISABLE_DBUS=1 -DDISABLE_RDMA=1 -DBUILD_SHARED_LIBS=1 .. && make && sudo make install

cd / && \
tar -czf /tmp/pcap.tgz \
    usr/local/lib/libpcap.so* \
    usr/local/lib/libpcap.a \
    usr/local/include/pcap/ \
    usr/local/bin/pcap-config \
    usr/local/lib/pkgconfig/libpcap.pc \
    $(find usr/local/share/man -name "pcap*") \
    ;

cd / && \
sudo tar -xzf /tmp/pcap.tgz -C / \
    && rm /tmp/pcap.tgz \
    ;
