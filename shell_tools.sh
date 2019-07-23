#!/bin/bash
if [ ! -d "$HOME/bin"  ]; then
    mkdir $HOME/bin
fi

git clone --depth 1 https://github.com/skywind3000/z.lua.git ~/.z.lua

wget -c https://github.com/sharkdp/fd/releases/download/v7.3.0/fd-v7.3.0-x86_64-unknown-linux-musl.tar.gz

wget -c https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep-0.10.0-x86_64-unknown-linux-musl.tar.gz

tar zxf fd-v7.3.0-x86_64-unknown-linux-musl.tar.gz

tar zxf ripgrep-0.10.0-x86_64-unknown-linux-musl.tar.gz

ln -s `pwd`/fd-v7.3.0-x86_64-unknown-linux-musl/fd $HOME/bin/fd
ln -s `pwd`/ripgrep-0.10.0-x86_64-unknown-linux-musl/rg $HOME/bin/rg

sudo yum install -y ruby rubygems tig htop

sduo gem install coderay rouge

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

~/.fzf/install

git config --global alias.tree "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative --all"
