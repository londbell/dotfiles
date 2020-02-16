#!/bin/sh
set -e
set -x

SYNHL_GIT_URL="https://github.com/zsh-users/zsh-syntax-highlighting.git"

git clone ${SYNHL_GIT_URL} "${DOTFILES_ZSH}"

# 移除可能存在的source信息
sed -i "" "\:source ${DOTFILES_ZSH}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh:d" ${HOME}/.zshrc
echo "source ${DOTFILES_ZSH}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${HOME}/.zshrc
