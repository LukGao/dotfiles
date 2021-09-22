#!/bin/bash
set -x
export SUDO="sudo"
export InstallCommand="default"
export ToolsDir="$HOME/.config/dotfiles"
export BinaryDir="$HOME/bin"
export DotfilesDir=$PWD

nvim_url='https://github.com/neovim/neovim/releases/download/v0.5.0/nvim-linux64.tar.gz'
fd_url=https://github.com/sharkdp/fd/releases/download/v8.2.1/fd-v8.2.1-x86_64-unknown-linux-musl.tar.gz
rg_url=https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep-12.1.1-x86_64-unknown-linux-musl.tar.gz
z_url='https://github.com/skywind3000/z.lua.git'
fzf_url='https://github.com/junegunn/fzf.git'

BasePath=$(cd `dirname $0`; pwd)
create_binary_dir()
{
    if [ ! -d ${BinaryDir} ]; then
        mkdir -p ${BinaryDir}
    fi
}

create_tools_dir()
{
    if [ ! -d ${ToolsDir} ]; then
        mkdir -p ${ToolsDir}
    fi
}
update_sudo()
{

    if [[ $(id -u) -eq 0 ]];then
        export SUDO=""
    else
        export SUDO="sudo"
    fi
}

update_install_command()
{
    export OS_NAME=$( cat /etc/os-release | grep ^NAME | cut -d'=' -f2 | sed 's/\"//gI' )    
    case "$OS_NAME" in    
      "CentOS Linux")    
        export OsName="centos"
        export InstallCommand=" ${SUDO} yum install -y "
        ${InstallCommand} epel-release
      ;;    
      "Ubuntu")    
        export OsName="ubuntu"
        export InstallCommand=" ${SUDO} apt-get install -y "
        ${SUDO} apt-get update
      ;;    
      *)    
    esac
}



ubuntu_install_prepare_software()
{
    ${InstallCommand} curl git wget libssl-dev
    ${InstallCommand} zlib1g-dev libtinfo-dev 
    ${InstallCommand} build-essential python-dev python3-dev  
    ${InstallCommand} python3-pip ruby rubygems tig htop tmux lua5.1
    ${InstallCommand} python-setuptools python3-setuptools
    ${InstallCommand} ruby rubygems tig htop tmux lua5.1
    pip3 install neovim jedi  pylint 
    ${SUDO} ln -sf `which python3` /usr/local/bin/python3
    ${SUDO} gem install coderay rouge
}

install_nvim()
{
    local old_dir=$PWD
    cd "$ToolsDir"
    curl -fL "$nvim_url" | tar -xzf -
    ln -sf $PWD/nvim-linux64/bin/nvim ${BinaryDir}/nvim
    cd ${old_dir}
}

plug_install()
{
    curl -sL install-node.now.sh/lts | sed '/confirm /d'  | bash
    export PATH=${BinaryDir}:$PATH
    which nvim
    echo "-----------------------------------------------------------"
    nvim +'PlugInstall --sync' +'PlugUpdate' +qa!
    nvim +'PlugInstall --sync' +'PlugUpdate' +qa!
}

cmake_install()
{
    local old_dir=$PWD
    cd "$ToolsDir"
    git clone https://github.com/Kitware/CMake.git
    cd CMake && git checkout `git describe --abbrev=0 --tags`
    ./bootstrap && make -j`nproc` && ${SUDO} make install
    cd ${old_dir}
}

ccls_install()
{
    ${InstallCommand} clang-8 clang-tools-8 libclang-8-dev
    ${SUDO} ln -sf /usr/bin/clang-8 /usr/bin/clang
    ${SUDO} ln -sf /usr/bin/clang++-8 /usr/bin/clang++

    local old_dir=$PWD
    cd "$ToolsDir"

    git clone --recursive https://github.com/MaskRay/ccls
    cd ccls && git checkout `git describe --abbrev=0 --tags`
    cmake  -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_RTTI=ON
    cmake --build Release -j`nproc`
    ln -sf `pwd`/Release/ccls ${BinaryDir}/ccls
    cd ${old_dir}
}
install_fzf_z()
{
    local old_dir=$PWD
    cd "$ToolsDir"

    git clone --depth 1 ${z_url} ~/.z.lua

    if ls $HOME/.fzf/bin/fzf 1> /dev/null 2>&1; then
        echo "fzf exist"
    else
        git clone --depth 1 ${fzf_url} ~/.fzf
        yes | ~/.fzf/install
    fi 
    cd ${old_dir}
}

install_fd_rg()
{
    local old_dir=$PWD
    cd "$ToolsDir"

    curl -fL $fd_url | tar -xzf -
    curl -fL $rg_url | tar -xzf -
    mv `pwd`/fd-v8.2.1-x86_64-unknown-linux-musl/fd ${BinaryDir}/fd
    mv `pwd`/ripgrep-12.1.1-x86_64-unknown-linux-musl/rg ${BinaryDir}/rg

    cd ${old_dir}
}

setting_git_config()
{
    git config --global alias.tree "log --graph --all --relative-date --abbrev-commit --format=\"%x09 %h %Cgreen%cd%Creset [%Cblue%cn%Creset] %C(auto)%d%Creset %s\""
}

update_bashrc_env()
{

    echo "export PATH=\$PATH:$BasePath/bashrc" >> $HOME/.bashrc
}

copy_confif_files()
{
    cp $BasePath/.inputrc $HOME
    cp $BasePath/.tmux_conf $HOME
    cp -r $BasePath/nvim $HOME/.config/nvim
}

main()
{
    create_tools_dir
    create_binary_dir
    update_sudo
    setting_git_config
    update_install_command
    ubuntu_install_prepare_software
    install_vim_plug
    install_nvim
    copy_confif_files
    plug_install
    cmake_install
    ccls_install
    install_fzf_z
    install_fd_rg
    update_bashrc_env
}

main "$@"

