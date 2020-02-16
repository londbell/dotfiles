#!/bin/sh
check_zsh() {
    if ! command -v zsh >/dev/null 2>&1; then
        echo "Zsh is not installed!Begin to install it"
        install_zsh
    else 
        echo "Zsh already installed,no need to install"  
    fi
}

install_zsh() {
    result=$(get_dist_name)
    if [ $result == "Ubuntu" ]; then
        apt install zsh
    elif [ $result == "CentOS"]; then
        yum install zsh
    elif [ $result =="Darwin" ]; then 
        brew install zsh
    fi
}

check_zsh
