#!/bin/bash

export SUDO="sudo"
export InstallCommand=""
export OsName=""
export Pwd=`pwd`

function check_user()
{
    if [[ `id -u` -eq 0 ]];then
        echo "root用户!"
        export SUDO=""
    else
        export SUDO="sudo"
        echo "非root用户!"
    fi
}

# 获取平台类型，mac还是linux平台
function get_platform_type()
{
    echo $(uname)
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

# 确认安装命令
function install_tools_on_linux()
{
    check_user
    get_linux_platform_type
    ${InstallCommand} curl
    curl -sL install-node.now.sh/lts | ${SUDO}  bash
    ${InstallCommand}  git wget  cmake  zlib1g-dev  libtinfo-dev ruby 
}

function clone_install_repository()
{
    git clone --depth=1 https://github.com/erikw/tmux-powerline.git ~/.tmux-powerline
    git clone --depth=1 https://github.com/ggyyll/dotfiles.git 
    cd dotfiles
    bash nvim_install.sh && bash shell_tools.sh
    bash install_go.sh && bash install_ccls.sh
    cd -

}


# main函数
function main()
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

# 调用main函数
main

