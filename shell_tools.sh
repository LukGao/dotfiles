#!/bin/bash

function create_dir
{
    if [ ! -d "${BinaryDir}"  ]; then
        mkdir ${BinaryDir}
    fi

    if [ ! -d "${ToolsDir}"  ]; then
        mkdir ${ToolsDir}
    fi
}

function install_tools1
{
    CURREN_DIR=${PWD}

    cd ${ToolsDir}

    
    wget -c https://raw.githubusercontent.com/ggyyll/dotfiles/master/bashrc -O ${ToolsDir}/.bashrc
    wget -c https://raw.githubusercontent.com/ggyyll/dotfiles/master/.inputrc -O ${ToolsDir}/.inputrc
    echo "source ${ToolsDir}/.bashrc" >> $HOME/.bashrc
#    ln -sf ${ToolsDir}/.inputrc $HOME/.inputrc
    cat ${ToolsDir}/.inputrc >> $HOME/.inputrc

    git clone --depth 1 https://github.com/skywind3000/z.lua.git ~/.z.lua
    wget -c https://github.com/sharkdp/fd/releases/download/v7.3.0/fd-v7.3.0-x86_64-unknown-linux-musl.tar.gz
    wget -c https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep-0.10.0-x86_64-unknown-linux-musl.tar.gz
    tar zxf fd-v7.3.0-x86_64-unknown-linux-musl.tar.gz
    tar zxf ripgrep-0.10.0-x86_64-unknown-linux-musl.tar.gz
    ln -sf `pwd`/fd-v7.3.0-x86_64-unknown-linux-musl/fd ${BinaryDir}/fd
    ln -sf `pwd`/ripgrep-0.10.0-x86_64-unknown-linux-musl/rg ${BinaryDir}/rg
    ${SUDO} gem install coderay rouge

    if ls $HOME/.fzf/bin/fzf 1> /dev/null 2>&1; then
        echo "fzf exist"
    else
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install
    fi

    ls -alrkh ${BinaryDir}

    git config --global alias.tree "log --graph --all --relative-date --abbrev-commit --format=\"%x09 %h %Cgreen%cd%Creset [%Cblue%cn%Creset] %C(auto)%d%Creset %s\""
    cd ${CURREN_DIR}

}

function centos_install_tmux()
{
    ${InstallCommand} https://centos7.iuscommunity.org/ius-release.rpm
    ${InstallCommand} tmux2u  ruby rubygems tig htop lua
}

function ubuntu_install_tmux
{
    ${InstallCommand} tmux
    git clone https://github.com/ggyyll/tmux-themepack.git ~/.tmux-themepack
    wget -c https://raw.githubusercontent.com/ggyyll/dotfiles/master/.tmux.conf -O ~/.tmux.conf
}


function ubuntu_install_tools
{
    ${InstallCommand}  ruby rubygems tig htop tmux lua5.1
}

function centos_install_tools
{
    ${InstallCommand}  ruby rubygems tig htop tmux lua5.1
}

function install_tools
{
    if [ ${OsName} == "ubuntu" ]; then
        ubuntu_install_tools
        ubuntu_install_tmux
    elif [ ${OsName} == "centos" ]; then
        centos_install_tools
        centos_install_tmux
    else
        echo "install tmux failed : ${OsName}"
    fi

}

. help.sh

create_dir
install_tools
install_tools1
