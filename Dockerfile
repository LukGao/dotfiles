FROM ubuntu:20.04
ARG DEBIAN_FRONTEND="noninteractive"
ARG DEBCONF_NOWARNINGS="yes"
ARG DEBCONF_TERSE="yes"

ENV LANG=zh_CN.UTF-8
ENV LANGUAGE=zh_CN.UTF-8
ENV LC_ALL=zh_CN.UTF-8
ENV TZ=Asia/Shanghai 
ENV nvim_url=https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz


RUN apt-get -qq update 
RUN apt-get install -y -qq locales
RUN locale-gen zh_CN.UTF-8  
RUN apt-get install -y -qq --no-install-recommends cowsay nyancat xz-utils curl wget git nodejs lua5.1 python3-dev python3-pip ruby rubygems 

RUN pip3 -qq install neovim

RUN rm -rf /var/lib/apt/lists/* 

RUN curl -fL "$nvim_url" | tar -xzf - 

RUN ls -al nvim-linux64/bin 
COPY nvim ~/.config/nvim

RUN nvim-linux64/bin/nvim --version 

RUN nvim-linux64/nvim --headless -c 'autocmd User PackerComplete quitall' -c 'silent PackerSync'
