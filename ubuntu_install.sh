#!/bin/bash
set -x
export SUDO="sudo"
export NONINTERACTIVE=1
export DEBIAN_FRONTEND=noninteractive

PROJECT_PATH=$(cd `dirname $0`; pwd)

cd "$(dirname "${BASH_SOURCE[0]}")"

if [[ $(id -u) -eq 0 ]];then
    export SUDO=""
fi

install_dep()
{
    echo "source $PROJECT_PATH/bashrc" >> ~/.bashrc

    ${SUDO} apt-get update -qq

    {SUDO} apt-get install -y build-essential curl git tmux wget python3 python3-dev python3-pip lua5.1 > /dev/null  2>&1
}

copy_dotfile()
{
    rm -rf ~/.inputrc 
    cp .inputrc ~
    rm -rf ~/.tmux.conf 
    cp .tmux.conf ~
    rm -rf ~/.z.lua 
    mkdir ~/.z.lua 
    cp z.lua ~/.z.lua/z.lua
    rm -rf ~/.tmux/plugins/fzf 
    mkdir -p ~/.tmux/plugins/fzf 
    cp tmux/fzf ~/.tmux/plugins/fzf/ 
    cp tmux/tm ~/.tmux/
    mkdir ~/.config
    ln -snf ${PROJECT_PATH}/nvim ~/.config/nvim
}

install_homebrew()
{
    export HOMEBREW_NO_AUTO_UPDATE=1
    export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
    export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
    export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
    export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"
    /bin/bash -c "$(curl -fsSL https://mirrors.ustc.edu.cn/misc/brew-install.sh)"
    sed -i '/check-run-command-as-root$/d' /home/linuxbrew/.linuxbrew/Homebrew/Library/Homebrew/brew.sh
    /home/linuxbrew/.linuxbrew/bin/brew update --force --quiet
    /home/linuxbrew/.linuxbrew/bin/brew update --force --quiet

    /home/linuxbrew/.linuxbrew/bin/brew install fzf && $(/home/linuxbrew/.linuxbrew/bin/brew --prefix)/opt/fzf/install --all
    /home/linuxbrew/.linuxbrew/bin/brew install fd
    /home/linuxbrew/.linuxbrew/bin/brew install rg
    /home/linuxbrew/.linuxbrew/bin/brew install bat
    /home/linuxbrew/.linuxbrew/bin/brew install tmux
    /home/linuxbrew/.linuxbrew/bin/brew install neovim
    /home/linuxbrew/.linuxbrew/bin/brew  install --HEAD universal-ctags/universal-ctags/universal-ctags
}
git_config()
{
    git config --global http.https://github.com.proxy socks5h://127.0.0.1:1080
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
