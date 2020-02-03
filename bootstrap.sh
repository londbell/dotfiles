#!/bin/sh

set -e
set -x

LOCAL=~/.local/
export ETC=${LOCAL}/etc
export BIN=${LOCAL}/bin
export DOTFILES_ZSH=${LOCAL}/zsh
export OH_MY_ZSH=~/.oh-my-zsh

# 存放clone而来的src,但不在这个目录里做修改，拷贝到安装目录后安装
export DOTFILESSRC=${LOCAL}/dotfilessrc
DOTFILES_GIT_URL="https://github.com/londbell/dotfiles.git"

mkdir -p ${ETC}
mkdir -p ${BIN}
mkdir -p ${DOTFILESSRC}

update_dotfiles() {
    cd ${LOCAL}
    if [ -d ${DOTFILESSRC} ]; then
        cd ${DOTFILESSRC}
        git pull
    else
        # 使用变量时前面加上$取值
        git clone ${DOTFILES_GIT_URL} ${DOTFILESSRC}
        cd ${DOTFILESSRC}
    fi

    cp -rf etc/* ${ETC}/
    cp -rf bin/* ${BIN}/
    cp -rf zsh/* ${DOTFILES_ZSH}/
    # cp bootstrap.sh $BIN/

    . ${BIN}/utils.sh
    . ${BIN}/install_git.sh
    . ${BIN}/install_zsh.sh
}


main() {
    # shell函数执行不需要()
    update_dotfiles

    check_zsh
    check_git
    sh ${ETC}/git_config_alias.sh
    sh ${BIN}/install_oh_my_zsh.sh

    # 复制主题到ZSH下
    cp -rf ${DOTFILES_ZSH}/themes/* ${OH_MY_ZSH}/custom/themes/

    # 复制插件到ZSH下
    cp -rf ${DOTFILES_ZSH}/plugins/* ${OH_MY_ZSH}/custom/plugins/


    # 安装Pure主题
    sh ${DOTFILES_ZSH}/install_pure.sh 
    
    # source
    sed source ~initsh
    sed source ~/.bash_profile

    # 最后安装zsh-syntax-highlighting,写入source
    sh ${DOTFILES_ZSH}/install_syntax.sh

}

main "$@"
