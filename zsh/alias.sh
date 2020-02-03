function gua() {
    git branch -r | grep -v '\->' | while read remote;do git branch --track "${remote#origin/}" "$remote";done
}

function gbr() {
    git branch
}

function gco() {
    git checkout
}

function gci() {
    git commit
}

function gst() {
    git status
}

alias -g ggg='| grep'
alias z='cd'
alias cls='clear'
alias ll='la -l'
alias la='ls -a'
alias vi='vim'
alias javac="javac -J-Dfile.encoding=utf8"
alias grep="grep --color=auto"
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias proxy='export http_proxy=http://127.0.0.1:1087'
alias proxys='export https_proxy=http://127.0.0.1:1087'
alias unproxy='unset http_proxy'
alias unproxys='unset https_proxy'
