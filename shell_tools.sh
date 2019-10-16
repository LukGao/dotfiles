#!/bin/bash

export SUDO="sudo"

function check_tools_dir()
{
    if [ ! -d "$HOME/bin"  ]; then
        mkdir $HOME/bin
    fi

    if [ ! -d "./tools"  ]; then
        mkdir tools 
    fi
}

function install_tools()
{
    cd tools

    git clone --depth 1 https://github.com/skywind3000/z.lua.git ~/.z.lua

    wget -c https://github.com/sharkdp/fd/releases/download/v7.3.0/fd-v7.3.0-x86_64-unknown-linux-musl.tar.gz

    wget -c https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep-0.10.0-x86_64-unknown-linux-musl.tar.gz

    tar zxf fd-v7.3.0-x86_64-unknown-linux-musl.tar.gz

    tar zxf ripgrep-0.10.0-x86_64-unknown-linux-musl.tar.gz

    ln -sf `pwd`/fd-v7.3.0-x86_64-unknown-linux-musl/fd $HOME/bin/fd
    ln -sf `pwd`/ripgrep-0.10.0-x86_64-unknown-linux-musl/rg $HOME/bin/rg

    ${SUDO} gem install coderay rouge

    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

    ~/.fzf/install

    git config --global alias.tree "log --graph --all --relative-date --abbrev-commit --format=\"%x09 %h %Cgreen%cd%Creset [%Cblue%cn%Creset] %C(auto)%d%Creset %s\""

    cd -
}


function centos_install_tools()
{
    ${InstallCommand}  ruby rubygems tig htop lua
    install_tools
}

function ubuntu_install_tools()
{
    ${InstallCommand}  ruby rubygems tig htop tmux lua5.1
    install_tools
}

# 在linux平台安装 tools
function install_tools_on_linux()
{
    check_tools_dir
    type=${OsName}
    if [ ${type} == "ubuntu" ]; then
        ubuntu_install_tools
    elif [ ${type} == "centos" ]; then
        centos_install_tools
    else
        echo "not support this linux platform type: "${type}
    fi
}

function main()
{
    install_tools_on_linux
}

. help.sh
main
