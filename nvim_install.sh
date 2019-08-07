#!/bin/bash

# 安装centos发行版必要软件
function install_prepare_software_on_centos()
{
    ${SUDO} yum whatprovides *bin/which
    ${InstallCommand} which ctags python-devel python3-devel 
}

# 安装ubuntu发行版必要软件
function install_prepare_software_on_ubuntu()
{
    ${InstallCommand} ctags build-essential python-dev python3-dev 
}



# 安装vim插件
function install_vim_plugin()
{
    echo "run PlugInstall"
    export PATH=$HOME/bin:$PATH 
    nvim +'PlugInstall --sync' +'PlugUpdate' +qa!
    cd $HOME/.vim/plugged/coc.nvim && ./install.sh && cd -
}

# 安装nodejs
function install_nodejs()
{
    curl -sL install-node.now.sh/lts | ${SUDO}  bash
}



# 更新配置
function update_config()
{
    cd config && git pull && cd -
}


# 安装nvim
function install_nvim()
{
    path=$HOME/bin
    if [ ! -d ${path} ]; then    
        mkdir ${path}
    fi    
    
    echo "export PATH=$HOME/bin:$PATH" >> $HOME/.bashrc
    cd dotfiles 
    wget -c https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
    tar zxf nvim-linux64.tar.gz && ln -sf `pwd`/nvim-linux64/bin/nvim $HOME/bin/nvim
    cd -
}


# 从 github clone 配置
function clone_config()
{
    git clone https://github.com/ooknn/dotfiles.git 
}
function link_nvim_config()
{
    cd dotfiles && ln -sf `pwd`/nvim/init.vim $HOME/.config/nvim/init.vim && ln -sf `pwd`/nvim/coc-settings.json $HOME/.config/nvim/coc-settings.json && cd -
}

# 从 github clone 配置
function clone_or_update_config()
{
    path=`pwd`/dotfiles    
    echo ${path}    
    if [ ! -d ${path} ]; then    
        echo "clone config"
        install_nodejs    
        clone_config
        install_nvim
        link_nvim_config
    else    
        echo "update config"    
        update_config
    fi    
}


function clone_config_from_git()
{
    clone_or_update_config
}

# 下载插件管理软件vim-plug
function download_vim_plug()
{
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

# 备份原来的配置(如果存在)
function save_old_config()
{
    path=$HOME/.config/nvim
    old_path=$HOME/.config/`date +%s`
    if [ ! -d ${path} ]; then
       echo "${path} not exist"
       echo "create ${path} "
       mkdir $HOME/.config/
       mkdir ${path}
    else
       echo "${path}  exist"
       mv ${path} ${old_path}
    fi
}

function begin_install_vimplus()
{
    # 保存旧文件
    save_old_config
    # 下载插件管理软件
    download_vim_plug
    # 克隆或者更新配置文件
    clone_config_from_git
    # 安装插件
    install_vim_plugin
}

# 在ubuntu发行版安装vimplus
function install_vimplus_on_ubuntu()
{
    install_prepare_software_on_ubuntu
    begin_install_vimplus
}

# 在centos发行版安装vimplus
function install_vimplus_on_centos()
{
    install_prepare_software_on_centos
    begin_install_vimplus
}


# 在linux平台安装vimplus
function install_vimplus_on_linux()
{
    type=${OsName}
    echo "linux platform type: "${type}
    if [ ${type} == "ubuntu" ]; then
        install_vimplus_on_ubuntu
    elif [ ${type} == "centos" ]; then
        install_vimplus_on_centos
    else
        echo "install failed"
    fi
}

# main函数
function main()
{
    install_vimplus_on_linux
}

# 调用main函数
main

