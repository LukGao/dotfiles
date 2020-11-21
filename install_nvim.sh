#!/bin/bash
export SUDO="sudo"
export InstallCommand="default"
export ToolsDir="$HOME/.config/dotfiles"
export BinaryDir="$HOME/bin"
export DotfilesDir=$PWD

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
    ${InstallCommand} python-pip python3-pip ruby rubygems tig htop tmux lua5.1
    ${InstallCommand} python-setuptools python3-setuptools
    python -m pip install --upgrade pip
    python3 -m pip install --upgrade pip
    pip install neovim  jedi  pylint
    pip3 install neovim jedi  pylint
    ln -sf `which python3` /usr/local/bin/python3
}

install_vim_plug()
{
    curl -sfLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

install_nvim()
{
    local nvim_url="https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz"
    cd "$ToolsDir"
    curl -fL "$nvim_url" | tar -xzf -
    ln -sf $PWD/nvim-linux64/bin/nvim ${BinaryDir}/nvim
    cd -
    curl -sfLo ~/.config/nvim/init.vim --create-dirs  https://raw.githubusercontent.com/ooknn/dotfiles/master/nvim/init.vim
    curl -sfLo  ~/.config/nvim/coc-settings.json --create-dirs  https://raw.githubusercontent.com/ooknn/dotfiles/master/nvim/coc-settings.json 
}

plug_install()
{
    curl -sL install-node.now.sh/lts | sed '/confirm /d'  | bash
    export PATH=${BinaryDir}:$PATH
    nvim +'PlugInstall --sync' +'PlugUpdate' +qa!
}

cmake_install()
{
    local old_dir=$PWD
    cd "$ToolsDir"
    git clone --depth=1 https://github.com/Kitware/CMake.git
    cd CMake
    ./bootstrap && make -j`nproc` && ${SUDO} make install
    cd ${old_dir}
}

ccls_install()
{
    ${InstallCommand} clang-8 clang-tools-8 libclang-8-dev
    ln -sf /usr/bin/clang-8 /usr/bin/clang
    ln -sf /usr/bin/clang++-8 /usr/bin/clang++

    local old_dir=$PWD
    cd "$ToolsDir"

    git clone --depth=1 --recursive https://github.com/MaskRay/ccls
    cd ccls
    cmake  -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_RTTI=ON
    cmake --build Release
    ln -sf `pwd`/Release/ccls ${BinaryDir}/ccls
    cd ${old_dir}
}

install_env_tools()
{

    local old_dir=$PWD
    cd "$ToolsDir"

    ${InstallCommand} ruby rubygems tig htop tmux lua5.1
    git clone --depth 1 https://github.com/skywind3000/z.lua.git ~/.z.lua

    if ls $HOME/.fzf/bin/fzf 1> /dev/null 2>&1; then
        echo "fzf exist"
    else
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        yes | ~/.fzf/install
    fi

    git config --global alias.tree "log --graph --all --relative-date --abbrev-commit --format=\"%x09 %h %Cgreen%cd%Creset [%Cblue%cn%Creset] %C(auto)%d%Creset %s\""

    fd_url=https://github.com/sharkdp/fd/releases/download/v7.3.0/fd-v7.3.0-x86_64-unknown-linux-musl.tar.gz
    rg_url=https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep-0.10.0-x86_64-unknown-linux-musl.tar.gz

    curl -fL $fd_url | tar -xzf -
    curl -fL $rg_url | tar -xzf -
    mv `pwd`/fd-v7.3.0-x86_64-unknown-linux-musl/fd ${BinaryDir}/fd
    mv `pwd`/ripgrep-0.10.0-x86_64-unknown-linux-musl/rg ${BinaryDir}/rg
    ${SUDO} gem install coderay rouge
    cd ${old_dir}
    cp .inputrc ~
    cp .tmux_conf ~
    echo "export PATH=\$PATH:$DotfilesDir/bashrc" >> $HOME/.bashrc
}

update_ubuntu_source_list()
{
    echo "update source list"
    mv /etc/apt/sources.list /etc/apt/sourses.list.backup

    tee /etc/apt/sources.list <<-'EOF'
deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
EOF
}

main()
{
    [ $# -ne 0 ] && update_ubuntu_source_list
    create_tools_dir
    create_binary_dir
    update_sudo
    update_install_command
    ubuntu_install_prepare_software
    install_vim_plug
    install_nvim
    plug_install
    cmake_install
    ccls_install
    install_env_tools
}

main "$@"

