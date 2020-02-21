#!/bin/bash
. ./help.sh

${InstallCommand} ibus-rime
${InstallCommand} librime-data-pinyin-simp

mkdir -p ~/.config/ibus/rime
cp ./rime/default.custom.yaml ~/.config/ibus/rime/default.custom.yaml
