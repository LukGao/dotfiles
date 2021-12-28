#!/bin/bash
set -x
export SUDO="sudo"
export InstallCommand="default"
export ToolsDir="$HOME/.config/dotfiles"
export BinaryDir="$HOME/bin"
export DotfilesDir=$PWD
export DEBIAN_FRONTEND=noninteractive

nvim_url=https://github.com/neovim/neovim/releases/download/v0.6.0/nvim-linux64.tar.gz
fd_url=https://github.com/sharkdp/fd/releases/download/v8.2.1/fd-musl_8.2.1_amd64.deb
rg_url=https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
z_url=https://github.com/skywind3000/z.lua.git
fzf_url=https://github.com/junegunn/fzf.git

BasePath=$(cd `dirname $0`; pwd)

echo "source $BasePath/bashrc" >> $HOME/.bashrc
echo "export PATH=${BinaryDir}:\$PATH" >> $HOME/.bashrc

[ ! -d ${BinaryDir} ] && mkdir -p ${BinaryDir}
[ ! -d ${ToolsDir} ] && mkdir -p ${ToolsDir}

mkdir -p $HOME/.tmux/plugins/fzf

cp $BasePath/.inputrc $HOME
cp $BasePath/.tmux.conf $HOME
ln -sf $BasePath/nvim $HOME/.config/nvim
cp $BasePath/tmux/fzf $HOME/.tmux/plugins/fzf/
cp $BasePath/tmux/tm $HOME/.tmux/


if [[ $(id -u) -eq 0 ]];then
    export SUDO=""
else
    export SUDO="sudo"
fi

export PATH=${BinaryDir}:$PATH

${SUDO} apt-get update -qq

export InstallCommand="${SUDO} apt-get install -y "

${InstallCommand} curl git tmux wget python3 python3-dev python3-pip lua5.1 > /dev/null  2>&1

pip3 install -q neovim

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

cd $ToolsDir
curl -sSfL "$nvim_url" | tar -xzf -
ln -sf $PWD/nvim-linux64/bin/nvim ${BinaryDir}/nvim
cd -


git clone --depth 1 ${z_url} ~/.z.lua

git clone --depth 1 ${fzf_url} ~/.fzf && yes | ~/.fzf/install

curl -sSfL -o rg.deb $rg_url && ${SUDO} dpkg -i rg.deb && rm -rf rg.deb

curl -sSfL -o fd.deb $fd_url && ${SUDO} dpkg -i fd.deb && rm -rf fd.deb

[[ -f .bashrc ]] && source .bashrc
[[ -f .bash_profile ]] && source .bash_profile

z -h
fzf --version
rg --version
fd --version
nvim --version
tmux -V

git config --global alias.tree "log --graph --all --relative-date --abbrev-commit --format=\"%x09 %h %Cgreen%cd%Creset [%Cblue%cn%Creset] %C(auto)%d%Creset %s\""
git config --global commit.gpgsign true
git config --global core.editor "vim"

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
