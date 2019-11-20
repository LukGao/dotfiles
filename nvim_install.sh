#!/bin/bash

function install_prepare_software_on_ubuntu
{
    ${InstallCommand} git wget curl cmake  zlib1g-dev  libtinfo-dev ruby yarn nodejs ctags build-essential python-dev python3-dev  
    ${InstallCommand} python-pip python3-pip
    ${InstallCommand} python-setuptools python3-setuptools
}

function install_prepare_software_on_centos()
{
    ${SUDO} yum whatprovides *bin/which
    ${SUDO} wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo
    ${InstallCommand} epel-release wget  centos-release-scl devtoolset-8 which ctags python-devel  python36-setuptools cmake3 nodejs yarn
    ${SUDO} easy_install-3.6 pip
    pip install neovim  jedi  pylint
    pip3 install neovim jedi  pylint
}


function download_vim_plug
{
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function install_nvim
{
    if [ ! -d ${BinaryDir} ]; then    
        mkdir ${BinaryDir}
    fi

    if [ ! -d ${ToolsDir} ]; then    
        mkdir ${ToolsDir}
    fi
    CURRENT_DIR=${PWD}
    cd ${ToolsDir}
    wget -c https://github.com/neovim/neovim/releases/download/v0.4.2/nvim-linux64.tar.gz
    tar zxf nvim-linux64.tar.gz && ln -sf `pwd`/nvim-linux64/bin/nvim ${BinaryDir}/nvim
    export PATH=${BinaryDir}:$PATH

    cd ${CURRENT_DIR}
}

function copy_nvim_config
{
    wget -c https://raw.githubusercontent.com/ggyyll/dotfiles/master/nvim/init.vim -O ~/.config/nvim/init.vim
    wget -c https://raw.githubusercontent.com/ggyyll/dotfiles/master/nvim/coc-settings.json -O ~/.config/nvim/coc-settings.json
}

function run_install_plug
{
    if ls ${BinaryDir}/nvim 1> /dev/null 2>&1; then

        if [ ${type} == "centos" ]; then
            install_coc_nvim
        fi
        echo "run PlugInstall"
        export PATH=${BinaryDir}:$PATH
        nvim +'PlugInstall --sync' +'PlugUpdate' +qa!
        ${BinaryDir}/nvim +'PlugInstall --sync' +'PlugUpdate' +qa!

    else

        echo "nvim do not exist"

    fi
}

function install_coc_nvim
{
    COC_DIR=$HOME/.vim/plugged/coc.nvim
    git clone --depth=1 https://github.com/neoclide/coc.nvim.git ${COC_DIR}
    cd ${COC_DIR} && ./install.sh && cd -
}

function install_prepare_software
{
    type=${OsName}
    if [ ${type} == "ubuntu" ]; then
        install_prepare_software_on_ubuntu
    elif [ ${type} == "centos" ]; then
        install_prepare_software_on_centos
    else
        echo "install failed"
    fi
}

. help.sh




install_prepare_software
download_vim_plug
copy_nvim_config
install_nvim
run_install_plug
