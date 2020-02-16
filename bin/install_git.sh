#!/bin/sh
#From https://github.com/hanxi/dotfiles

# version=2.19.2
# download_file_name=v${version}.tar.gz
# ile_name=git-${version}.tar.gz

# mkdir -p ~/app-src
# cd ~/app-src

# if [ ! -f ${file_name} ]; then
#     wget -O ${file_name} https://github.com/git/git/archive/${download_file_name}
#     tar -zxvf ${file_name}
# fi

# TODO: check system
# Ubuntu
# sudo apt-get install dh-autoreconf libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev
# cd ~/app-src/git-${version}
# make prefix=$HOME/.local/ install

# TODO: check system
# CentOS
# sudo yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel
# sudo yum install  gcc perl-ExtUtils-MakeMaker
# cd ~/app-src
# wget http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.15.tar.gz
# tar -zxvf libiconv-1.15.tar.gz
# ./configure --prefix=$HOME/.local
# make install
# cd ~/app-src/git-${version}
# make configure
# ./configure --prefix=$HOME/.local --with-iconv=$HOME/.local/lib
# make install

check_git() {
    if ! command -v git >/dev/null 2>&1; then
        echo "Git is not installed!Begin to install it"
        install_git
    else 
        echo "Git already installed,no need to install"  
    fi
}

install_git() {
    result=$(get_dist_name)
    if [ $result == "Ubuntu" ]; then
        apt install git
    elif [ $result == "CentOS"]; then
        yum install git
    elif [ $result =="Darwin" ]; then 
        brew install git
    fi
}
