#!/bin/bash

function ubuntu_ccls
{
    CURR_DIR=${PWD}
    cd ${ToolsDir}
    git clone --depth=1 --recursive https://github.com/MaskRay/ccls
    cd ccls 
    wget -c http://releases.llvm.org/9.0.0/clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
    tar xf clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
    ${CMAKE} -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_PREFIX_PATH=${PWD}/clang+llvm-9.0.0-x86_64-linux-gnu-ubuntu-18.04
    cmake --build Release
    ln -sf `pwd`/Release/ccls ${BinaryDir}/ccls
    cd ${CURR_DIR}
}

. help.sh

ubuntu_ccls
