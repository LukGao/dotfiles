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
export GO111MODULE=on
export GOPROXY=https://goproxy.io

go install golang.org/x/tools/gopls

