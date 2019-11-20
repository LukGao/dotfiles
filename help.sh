#!/bin/bash
export SUDO="sudo"
export ToolsDir="$HOME/.config/tools"
export BinaryDir="$HOME/bin"
export InstallCommand="default"
export NvimConfigDir="default"
export VimPlugDir="default"
export OsName="default"
export UNAME="default"
export CMAKE="default"

function echo_env
{
    echo "SUDO : ${SUDO}"
    echo "UNAME : ${UNAME}"
    echo "OS_NAME : ${OsName}"
    echo "InstallCommand : ${InstallCommand}"
    echo "NvimConfigDir : ${NvimConfigDir}"
    echo "VimPlugDir : ${VimPlugDir}"
    echo "BinaryDir : ${BinaryDir}" 
    echo "CMAKE : ${CMAKE}"
    echo "ToolsDir : ${ToolsDir}"
}



function check_user()
{

    if [[ $(id -u) -eq 0 ]];then
        export SUDO=""
    else
        export SUDO="sudo"
    fi
}

function platform_type
{
    echo $(uname)
}
function get_platform_type()
{
    export UNAME=$( uname )
}

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

check_user
get_platform_type
get_linux_platform_type
echo_env
