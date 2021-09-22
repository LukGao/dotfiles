FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Asia/Shanghai \
    nvim_url=https://github.com/neovim/neovim/releases/download/v0.5.0/nvim-linux64.tar.gz \
    llvm_url=https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/clang+llvm-12.0.0-x86_64-linux-gnu-ubuntu-20.04.tar.xz 

RUN mkdir -p ~/.config/nvim
RUN apt -qq  update 
RUN apt install -y --no-install-recommends cowsay nyancat
RUN apt install -y -qq xz-utils  curl wget git nodejs lua5.1 python3-dev >/dev/null 
RUN apt install -y -qq python3-pip ruby rubygems >/dev/null 
RUN rm -rf /var/lib/apt/lists/* 

RUN curl -fL "$nvim_url" | tar -xzf - 
RUN ls -al nvim-linux64/bin 
RUN git clone https://github.com/ooknn/dotfiles.git dotfiles
RUN mv dotfiles/nvim ~/.config/nvim 
RUN pip3 -q install neovim jedi  pylint 
RUN nvim-linux64/bin/nvim --version 
RUN nvim-linux64/bin/nvim +'PlugInstall --sync' +'PlugUpdate' +qa! 
RUN nvim-linux64/bin/nvim +'PlugInstall --sync' +'PlugUpdate' +qa!
RUN git clone --depth 1 https://github.com/skywind3000/z.lua.git ~/.z.lua 

RUN wget -cq "$llvm_url" 
RUN ls -al  
RUN tar -xf clang+llvm-12.0.0-x86_64-linux-gnu-ubuntu-20.04.tar.xz 
RUN mv clang+llvm-12.0.0-x86_64-linux-gnu-ubuntu-20.04 llvm 
RUN rm -rf *.xz
RUN ls -al llvm 
RUN ls -al llvm/bin 
RUN PATH="$PWD/llvm/bin:${PATH}" 
RUN echo $PATH 
