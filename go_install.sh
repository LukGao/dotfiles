#!/bin/bash

export SUDO="sudo"
export InstallCommand=""
export OsName=""

. help.sh

${InstallCommand} wget curl
wget -c https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz
tar -xzf go1.12.7.linux-amd64.tar.gz
${SUDO} mv go /usr/local
mkdir $HOME/go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export GO111MODULE=on
export GOPROXY=https://goproxy.io

go install golang.org/x/tools/gopls

