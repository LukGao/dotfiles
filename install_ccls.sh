#!/bin/bash

CMAKE="cmake"

function ubuntu_ccls()
{
    git clone --depth=1 --recursive https://github.com/MaskRay/ccls
    cd ccls 
    wget -c http://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
    tar xf clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
    ${CMAKE} -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$PWD/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04

    cd Release

    make -j`cat /proc/cpuinfo |grep "processor"|wc -l` 

    ln -sf `pwd`/ccls $HOME/bin/ccls
}

function centos_ccls()
{
    scl enable devtoolset-7 bash
    CURR_DIR=`pwd`
    LLVM_INSTALL_DIR="/usr/local/llvm"

    GCC_DIR=`which gcc`
    G_DIR=`which g++`

    git clone https://git.llvm.org/git/llvm.git ${CURR_DIR}/llvm
    git clone https://git.llvm.org/git/clang.git ${CURR_DIR}/llvm/tools/clang

    cd ${CURR_DIR}/llvm
     
    ${CMAKE} -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DLLVM_TARGETS_TO_BUILD=X86 -DCMAKE_CXX_COMPILER=${G_DIR} -DCMAKE_C_COMPILER=${GCC_DIR} -DCMAKE_INSTALL_PREFIX=${LLVM_INSTALL_DIR} -DLLVM_ENABLE_RTTI=ON
     
    cd Release

    make -j`cat /proc/cpuinfo |grep "processor"|wc -l` clangFormat clangFrontendTool clangIndex clangTooling clang

    cd ${CURR_DIR}

    git clone --depth=1 --recursive https://github.com/MaskRay/ccls ${CURR_DIR}/ccls
    cd ccls
    ${CMAKE} -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_RTTI=ON -DCMAKE_CXX_COMPILER=${G_DIR} -DSYSTEM_CLANG=ON -DCMAKE_PREFIX_PATH="${CURR_DIR}/llvm/Release;${CURR_DIR}/llvm/Release/tools/clang;${CURR_DIR}/llvm;${CURR_DIR}/llvm/tools/clang"

    cd Release

    make -j`cat /proc/cpuinfo |grep "processor"|wc -l` 

    ln -sf `pwd`/ccls $HOME/bin/ccls
    cd ${CURR_DIR}
    exit
}


# 获取linux平台类型，ubuntu还是centos
function get_linux_platform_type()
{
    export OS_NAME=$( cat /etc/os-release | grep ^NAME | cut -d'=' -f2 | sed 's/\"//gI' )    
    case "$OS_NAME" in    
      "CentOS Linux")    
        echo "centos" # centos redhat系列
      ;;    
      "Ubuntu")    
        echo "ubuntu" # debian ubuntu系列
      ;;    
      *)    
    esac    
}



function main()
{
    type=`get_linux_platform_type`
    echo ${type}
    if [ ${type} == "centos" ]; then
        CMAKE="cmake3"
        centos_ccls
    elif [ ${type} == "ubuntu" ];then
        ubuntu_ccls
    else
        echo "not support platform type: "${type}
    fi
}

main
