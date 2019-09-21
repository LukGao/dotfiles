#!/bin/bash

export SUDO="sudo"
export InstallCommand=""
export OsName=""
export Pwd=`pwd`
export UNAME=""


# 确认安装命令
function install_tools_on_linux()
{
    curl -sL install-node.now.sh/lts | ${SUDO}  bash
    ${InstallCommand}  git wget  cmake  zlib1g-dev  libtinfo-dev ruby 
}

function clone_install_repository()
{
    git clone --depth=1 https://github.com/ggyyll/dotfiles.git 
    cd dotfiles
    bash nvim_install.sh && bash shell_tools.sh
    bash install_go.sh 
    # bash install_ccls.sh
    cd -

}


# main函数
function main()
{
    type=${UNAME}
    if [ ${type} == "Linux" ]; then
        install_tools_on_linux 
        clone_install_repository
    else
        echo "not support platform type: "${type}
    fi
}

# 调用main函数
. help.sh
main
