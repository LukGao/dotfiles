FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Asia/Shanghai \
    nvim_url=https://github.com/neovim/neovim/releases/download/v0.5.0/nvim-linux64.tar.gz \
    llvm_url=https://github.com/llvm/llvm-project/releases/download/llvmorg-12.0.0/clang+llvm-12.0.0-x86_64-linux-gnu-ubuntu-20.04.tar.xz 

RUN mkdir -p ~/.config/nvim
RUN apt -qq  update \
&& apt install -y -qq  xz-utils  curl wget git nodejs lua5.1 python3-dev python3-setuptools python3-pip ruby rubygems >/dev/null \
&& rm -rf /var/lib/apt/lists/* \
&& wget -cq "$llvm_url" && ls -al \ 
&& tar -xf clang+llvm-12.0.0-x86_64-linux-gnu-ubuntu-20.04.tar.xz \
&& mv clang+llvm-12.0.0-x86_64-linux-gnu-ubuntu-20.04 llvm \
&& rm -rf *.xz 
RUN ls -al llvm && ls -al llvm/bin \
&& PATH="$PWD/llvm/bin:${PATH}" \
&& echo $PATH \
&& curl -fL "$nvim_url" | tar -xzf - \
&& ls -al $PWD/nvim-linux64/bin \
&& PATH="$PWD/nvim-linux64/bin:${PATH}" \
&& echo $PATH 
RUN git clone https://github.com/ooknn/dotfiles.git dotfiles
RUN mv dotfiles/nvim ~/.config/nvim 
RUN pip3 -q install neovim jedi  pylint \
&& nvim --version \
&& nvim +'PlugInstall --sync' +'PlugUpdate' +qa! \
&& nvim +'PlugInstall --sync' +'PlugUpdate' +qa!\
&& git clone --depth 1 https://github.com/skywind3000/z.lua.git ~/.z.lua \
&& gem install coderay rouge
