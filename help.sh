#!/bin/bash

export SUDO="sudo"
export Pwd=`pwd`
export InstallCommand=""
export OsName=""
export UNAME=""

function check_user()
{
    if [[ `id -u` -eq 0 ]];then
        export SUDO=""
    else
        export SUDO="sudo"
    fi
}

# 获取平台类型，mac还是linux平台
function get_platform_type()
{
    export UNAME=`uname`
}


# 获取linux平台类型，ubuntu还是centos
function get_linux_platform_type()
{
    export OS_NAME=$( cat /etc/os-release | grep ^NAME | cut -d'=' -f2 | sed 's/\"//gI' )    
    case "$OS_NAME" in    
      "CentOS Linux")    
        export OsName="centos"
        export InstallCommand=" ${SUDO} yum install -y "
        export CMAKE="cmake3"
      ;;    
      "Ubuntu")    
        export OsName="ubuntu"
        export InstallCommand=" ${SUDO} apt install -y "
        export CMAKE="cmake"
      ;;    
      *)    
    esac    
}

function install_tools_1()
{
    check_user
    get_linux_platform_type
    echo "InstallCommand : ${InstallCommand}"
    ${InstallCommand}  git wget  cmake  zlib1g-dev  libtinfo-dev ruby 
}


function echo_env()
{
    echo "SUDO : ${SUDO}"
    echo "OS_NAME : ${OsName}"
    echo "InstallCommand : ${InstallCommand}"
    echo "CMAKE : ${CMAKE}"
    echo "PWD : ${Pwd}"
}

check_user
get_platform_type
get_linux_platform_type
echo_env
install_tools_1
