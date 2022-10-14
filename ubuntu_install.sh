#!/bin/bash
set -x
export SUDO="sudo"
export InstallCommand="default"
export DEBIAN_FRONTEND=noninteractive
export BREW=/home/linuxbrew/.linuxbrew/bin/brew

BasePath=$(cd `dirname $0`; pwd)

cd "$(dirname "${BASH_SOURCE[0]}")"

if [[ $(id -u) -eq 0 ]];then
    export SUDO=""
fi

install_dep()
{
    export InstallCommand="${SUDO} apt-get install -y "

    echo "source $BasePath/bashrc" >> ~/.bashrc

    ${SUDO} apt-get update -qq

    ${InstallCommand} build-essential curl git tmux wget python3 python3-dev python3-pip lua5.1 > /dev/null  2>&1
}

copy_dotfile()
{

    rm -rf ~/.inputrc && cp .inputrc ~
    rm -rf ~/.tmux.conf && cp .tmux.conf ~
    rm -rf ~/.z.lua && mkdir ~/.z.lua && cp z.lua ~/.z.lua/z.lua
    rm -rf ~/.tmux/plugins/fzf && mkdir -p ~/.tmux/plugins/fzf && cp tmux/fzf ~/.tmux/plugins/fzf/ && cp tmux/tm ~/.tmux/
    rm -rf  ~/.local/share/nvim/site/pack/packer/start/
    mkdir -p ~/.local/share/nvim/site/pack/packer/start/
    cp -r packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    ln -snf ${BasePath}/nvim ~/.config/nvim
}



install_homebrew()
{
    export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
    export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/linuxbrew-core.git"
    /bin/bash -c "$(curl -fsSL https://gitee.com/ineo6/homebrew-install/raw/master/install.sh)"
    echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/linuxbrew-bottles/bottles' >> ~/.bashrc
    source ~/.bashrc

    brew update
    
    command -v fzf > /dev/null || ($BREW install fzf && $($BREW --prefix)/opt/fzf/install)
    command -v fd > /dev/null || $BREW install fd
    command -v rg > /dev/null || $BREW install rg
    command -v node > /dev/null || $BREW install node
    command -v tmux > /dev/null || $BREW install tmux


    # echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc
    unset HOMEBREW_CORE_GIT_REMOTE
    unset HOMEBREW_BREW_GIT_REMOTE
}
git_config()
{
    git config --global alias.tree "log --graph --all --relative-date --abbrev-commit --format=\"%x09 %h %Cgreen%cd%Creset [%Cblue%cn%Creset] %C(auto)%d%Creset %s\""
    git config --global commit.gpgsign true
    git config --global core.editor "nvim"
}

copy_dotfile

install_dep

install_homebrew

git_config

# tee ~/.curlrc <<-'EOF'
# socks5=127.0.0.1:1080
# EOF

# tee ~/.gitconfig <<-'EOF'
# [http]
#    proxy = socks5://127.0.0.1:1080
# EOF
