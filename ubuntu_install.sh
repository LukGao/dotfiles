#!/bin/bash
set -x
export SUDO="sudo"
export InstallCommand="default"
export ToolsDir="$HOME/.config/dotfiles"
export BinaryDir="$HOME/bin"
export DotfilesDir=$PWD
export DEBIAN_FRONTEND=noninteractive

nvim_url='https://github.com/neovim/neovim/releases/download/v0.5.0/nvim-linux64.tar.gz'
fd_url=https://github.com/sharkdp/fd/releases/download/v8.2.1/fd-musl_8.2.1_amd64.deb
rg_url=https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
z_url='https://github.com/skywind3000/z.lua.git'
fzf_url='https://github.com/junegunn/fzf.git'

BasePath=$(cd `dirname $0`; pwd)

echo "source $BasePath/bashrc" >> $HOME/.bashrc
echo "export PATH=${BinaryDir}:\$PATH" >> $HOME/.bashrc

[ ! -d ${BinaryDir} ] && mkdir -p ${BinaryDir}

[ ! -d ${ToolsDir} ] && mkdir -p ${ToolsDir}

cp $BasePath/.inputrc $HOME
cp $BasePath/.tmux.conf $HOME
cp $BasePath/.tmux.conf.local $HOME
cp -r $BasePath/nvim $HOME/.config/nvim


if [[ $(id -u) -eq 0 ]];then
    export SUDO=""
else
    export SUDO="sudo"
fi

export PATH=${BinaryDir}:$PATH

${SUDO} apt-get update -qq

export InstallCommand="${SUDO} apt-get install -y "


install_prepare_software()
{
    ${InstallCommand} curl git wget libssl-dev zlib1g-dev libtinfo-dev build-essential python-dev python3-dev  python3-pip python-setuptools ruby rubygems tig htop tmux lua5.1 > /dev/null  2>&1
    pip3 install -q neovim
    ${SUDO} ln -sf `which python3` /usr/local/bin/python3
    ${SUDO} gem install -q coderay rouge
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
    curl -sSL install-node.now.sh/lts | sed '/confirm /d'  | ${SUDO} bash

    echo "-----------------------------------------------------------"
    ${BinaryDir}/nvim +'PlugInstall --sync' +'PlugUpdate' +qa!
    ${BinaryDir}/nvim +'PlugInstall --sync' +'PlugUpdate' +qa!
}



ccls_install()
{
    ${InstallCommand} build-essential clang-8 clang-tools-8 libclang-8-dev libz-dev cmake > /dev/null  2>&1
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
    git clone --depth 1 ${z_url} ~/.z.lua
    git clone --depth 1 ${fzf_url} ~/.fzf
    yes | ~/.fzf/install
}

install_fd_rg()
{
    curl -sSfL -o rg.deb $rg_url && ${SUDO} dpkg -i rg.deb && rm -rf rg.deb
    curl -sSfL -o fd.deb $fd_url && ${SUDO} dpkg -i fd.deb && rm -rf fd.deb
}

setting_git_config()
{
    git config --global alias.tree "log --graph --all --relative-date --abbrev-commit --format=\"%x09 %h %Cgreen%cd%Creset [%Cblue%cn%Creset] %C(auto)%d%Creset %s\""
    git config --global commit.gpgsign true
    git config --global core.editor "vim"
}


main()
{
    # set_proxy

    install_prepare_software
    setting_git_config
    install_nvim
    plug_install
    install_fzf_z
    install_fd_rg
    ccls_install
}

main "$@"


# set_proxy()
# {
# tee ~/.curlrc <<-'EOF'
# socks5=127.0.0.1:1080
# EOF

# tee ~/.gitconfig <<-'EOF'
# [http]
#    proxy = socks5://127.0.0.1:1080
# EOF
# }
