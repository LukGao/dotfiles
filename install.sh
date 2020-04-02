#!/bin/bash

export SUDO="sudo"
export InstallCommand=""
export OsName=""


function check_user
{
    if [[ `id -u` -eq 0 ]];then
        export SUDO=""
    else
        export SUDO="sudo"
    fi
}

# mac or linux
function get_platform_type
{
    echo $(uname)
}

# linux ubuntu or cenots
function get_linux_platform_type
{
    export OS_NAME=$( cat /etc/os-release | grep ^NAME | cut -d'=' -f2 | sed 's/\"//gI' )    
    case "$OS_NAME" in    
      "CentOS Linux")    
        export InstallCommand=" ${SUDO} yum install -y "
        export OsName="centos"
      ;;    
      "Ubuntu")    
        export OsName="ubuntu"
        export InstallCommand=" ${SUDO} apt install -y "
      ;;    
      *)    
    esac    
}

# install command
function install_tools_on_linux
{
    check_user
    get_linux_platform_type
    echo "InstallCommand : ${InstallCommand}"
    ${InstallCommand}  git wget curl  
}

# clone  respository
function clone_install_repository
{
    git clone --depth=1 https://github.com/ooknn/dotfiles.git 
    cd dotfiles
    bash nvim_install.sh
    bash shell_tools.sh
    bash ccls_install.sh
    cd -

}


function main
{
    type=`get_platform_type`

    echo "platform type: "${type}

    if [ ${type} == "Linux" ]; then
        install_tools_on_linux 
        clone_install_repository
    else
        echo "not support platform type: "${type}
    fi
}

#  call main
main


