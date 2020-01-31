#!/bin/sh

set -e
set -x

ETC=~/.local/etc
BIN=~/.local/bin
DOTFILES_GIT_URL="https://github.com/londbell/dotfiles.git"


mkdir -p $ETC
mkdir -p $BIN

updateDotfiles() {
    cd ~/.local/
    if [ -d dotfiles ]; then
        cd dotfiles
        git pull
    else
        # 使用变量时前面加上$取值
        git clone $DOTFILES_GIT_URL
        cd dotfiles
    fi

    cp -rf etc/* $ETC/
    cp -rf bin/* $BIN/
    cp bootstrap.sh $BIN/
}

configGit() {
    cd ~/.local/
    if [ -f etc/git-config.sh ]; then
        sh git-config.sh
    else
        echo "git.sh don't exist;"
    fi
}

# shell函数执行不需要()
updateDotfiles
configGit