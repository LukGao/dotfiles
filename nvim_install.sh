#!/bin/bash

NvimConfigDir=$HOME/.config/nvim

# 安装centos发行版必要软件
function install_prepare_software_on_centos()
{
    ${SUDO} yum whatprovides *bin/which
    ${InstallCommand} epel-release
    ${InstallCommand} centos-release-scl
    ${InstallCommand} devtoolset-8
    ${InstallCommand} which ctags python-devel  python36-setuptools cmake3
    ${SUDO} easy_install-3.6 pip
    pip install neovim
    pip install jedi
    pip install pylint
    pip3 install neovim
    pip3 install jedi
    pip3 install pylint
}

# 安装ubuntu发行版必要软件
function install_prepare_software_on_ubuntu()
{    
 
    ${InstallCommand} ctags build-essential python-dev python3-dev cmake 
    ${InstallCommand} python-pip python3-pip
    ${InstallCommand} python-setuptools python3-setuptools
    ${InstallCommand}  zlib1g-dev  libtinfo-dev 
    pip install neovim
    pip install jedi
    pip install pylint
    pip3 install neovim
    pip3 install jedi
    pip3 install pylint
}



# 安装vim插件
function install_vim_plugin()
{
    cd ${Pwd}
    echo "run PlugInstall"
    export PATH=$HOME/bin:$PATH 
    nvim +'PlugInstall --sync' +'PlugUpdate' +qa!
    cd $HOME/.vim/plugged/coc.nvim && ./install.sh 
    cd -
}

# 安装nodejs
function install_nodejs()
{
    cd ${Pwd}
     curl -sL install-node.now.sh/lts | ${SUDO}  bash
}

# 拷贝配置文件
function copy_config()
{
    cd ${Pwd}
    echo "source ${Pwd}/dotfiles/bashrc" >> $HOME/.bashrc
    cat ${Pwd}/dotfiles/.inputrc > $HOME/.inputrc
    cat ${Pwd}/dotfiles/.tmux.conf > $HOME/.tmux.conf
    cat ${Pwd}/dotfiles/.tmux.conf.local > $HOME/.tmux.conf.local 
    cat ${Pwd}/dotfiles/.clang-format > $HOME/.clang-format
}

# 安装nvim
function install_nvim()
{
    cd ${Pwd}
    if [ ! -d $HOME/bin ]; then    
        mkdir $HOME/bin
    fi    

    if [ ! -d ${Pwd}/dotfiles/tools ]; then    
        mkdir ${Pwd}/dotfiles/tools 
    fi    
    
    cd ${Pwd}/dotfiles/tools
    echo "export PATH=$HOME/bin:$PATH" >> $HOME/.bashrc
    wget -c https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
    tar zxf nvim-linux64.tar.gz && ln -sf `pwd`/nvim-linux64/bin/nvim $HOME/bin/nvim
}

function link_nvim_config()
{
    cd ${Pwd}
    ln -sf ${Pwd}/dotfiles/nvim/init.vim ${NvimConfigDir}/init.vim && ln -sf ${Pwd}/dotfiles/nvim/coc-settings.json ${NvimConfigDir}/coc-settings.json 
}

function clone_config_from_git()
{
    install_nvim
    link_nvim_config
}

# 下载插件管理软件vim-plug
function download_vim_plug()
{
    cd ${Pwd}
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
    # 安装nodejs
    install_nodejs    
    # 保存旧文件
    save_old_config
    # 下载插件管理软件
    download_vim_plug
    # 克隆或者更新配置文件
    clone_config_from_git
    # 安装插件
    install_vim_plugin
    #
    copy_config
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

