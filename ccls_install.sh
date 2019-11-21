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
    ${CMAKE} --build Release
    ln -sf `pwd`/Release/ccls ${BinaryDir}/ccls
    ls -alrkh ${BinaryDir}
    cd ${CURR_DIR}
    . $HOME/.bashrc
    echo $PATH
}

function centos_ccls
{
    ${SUDO} yum whatprovides *bin/which
    ${InstallCommand} epel-release  centos-release-scl devtoolset-8 git
    source /opt/rh/devtoolset-8/enable
    OLD_DIR=${PWD}
    cd ${ToolsDir}
    CURR_DIR=`pwd`
    LLVM_INSTALL_DIR="/usr/local/llvm"

    ${InstallCommand} cmake3 
    GCC_DIR=`which gcc`
    G_DIR=`which g++`

    git clone  --depth=1 https://git.llvm.org/git/llvm.git ${CURR_DIR}/llvm
    git clone  --depth=1 https://git.llvm.org/git/clang.git ${CURR_DIR}/llvm/tools/clang

    cd ${CURR_DIR}/llvm
     
    ${CMAKE} -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DLLVM_TARGETS_TO_BUILD=X86 -DCMAKE_CXX_COMPILER=${G_DIR} -DCMAKE_C_COMPILER=${GCC_DIR} -DCMAKE_INSTALL_PREFIX=${LLVM_INSTALL_DIR} -DLLVM_ENABLE_RTTI=ON
     
    ${CMAKE} --build Release

    cd ${CURR_DIR}

    git clone --depth=1 --recursive https://github.com/MaskRay/ccls ${CURR_DIR}/ccls
    cd ccls
    ${CMAKE} -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_RTTI=ON -DCMAKE_CXX_COMPILER=${G_DIR} -DCMAKE_PREFIX_PATH="${CURR_DIR}/llvm/Release;${CURR_DIR}/llvm/Release/tools/clang;${CURR_DIR}/llvm;${CURR_DIR}/llvm/tools/clang"
    ${CMAKE} --build Release
    ln -sf `pwd`/Release/ccls ${BinaryDir}/ccls
    ls -alrkh ${BinaryDir}
    cd ${OLD_DIR}
}


function install_ccls
{
    if [ ${OsName} == "ubuntu" ]; then
        ubuntu_ccls
    elif [ ${OsName} == "centos" ]; then
        centos_ccls
    else
        echo "install tmux failed : ${OsName}"
    fi
}

. help.sh

install_ccls
