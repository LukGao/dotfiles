#!/bin/bash

export InstallCommand=""
export OsName=""

function ubuntu_install_tmux()
{
    ${InstallCommand} tmux
}

function centos_install_tmux()
{
    ${InstallCommand} https://centos7.iuscommunity.org/ius-release.rpm
    ${InstallCommand} tmux2u
}

function tmux_conf()
{
              
    git clone https://github.com/ggyyll/tmux-themepack.git ~/.tmux-themepack
    wget -c https://github.com/ggyyll/dotfiles/blob/master/.tmux.conf -O ~/.tmux.conf 
}

function main()
{
    if [ ${OsName} == "centos" ]; then
        echo ""
        centos_install_tmux
        tmux_conf
    elif [ ${OsName} == "ubuntu" ];then
        echo ""
        ubuntu_install_tmux
        tmux_conf
    else
        echo "not support platform OsName: "${OsName}
    fi
}

. help.sh
main
