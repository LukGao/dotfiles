#!/bin/bash

SUDO="sudo"
InstallCommand=""
OsName=""

function check_user()
{
    if [[ `id -u` -eq 0 ]];then
        echo "root用户!"
        SUDO=""
    else
        SUDO="sudo"
        echo "非root用户!"
    fi
}

# 获取linux平台类型，ubuntu还是centos
function get_linux_platform_type()
{
    export OS_NAME=$( cat /etc/os-release | grep ^NAME | cut -d'=' -f2 | sed 's/\"//gI' )    
    case "$OS_NAME" in    
      "CentOS Linux")    
        export InstallCommand=" ${SUDO} yum install -y "
        export OsName="centos"
        echo "centos" # centos redhat系列
      ;;    
      "Ubuntu")    
        export OsName="ubuntu"
        export InstallCommand=" ${SUDO} apt install -y "
        echo "ubuntu" # debian ubuntu系列
      ;;    
      *)    
    esac    
}

check_user
get_linux_platform_type
${InstallCommand} wget curl
wget https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz
tar -xzf go1.12.7.linux-amd64.tar.gz
mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
mkdir $HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
go env

export GO111MODULE=on
export GOPROXY=https://goproxy.io
#export GOPROXY=https://mirrors.aliyun.com/goproxy/

go install github.com/go-delve/delve/cmd/dlv
go install github.com/kisielk/errcheck
go install github.com/davidrjenni/reftools/cmd/fillstruct
go install github.com/mdempsky/gocode
go install github.com/stamblerre/gocode
go install github.com/rogpeppe/godef
go install github.com/zmb3/gogetdoc
go install golang.org/x/tools/cmd/goimports
go install golang.org/x/lint/golint
go install golang.org/x/tools/gopls
go install github.com/alecthomas/gometalinter
go install github.com/golangci/golangci-lint/cmd/golangci-lint
go install github.com/fatih/gomodifytags
go install golang.org/x/tools/cmd/gorename
go install github.com/jstemmer/gotags
go install golang.org/x/tools/cmd/guru
go install github.com/josharian/impl
go install honnef.co/go/tools/cmd/keyify
go install github.com/fatih/motion
go install github.com/klauspost/asmfmt/cmd/asmfmt
go install github.com/koron/iferr
