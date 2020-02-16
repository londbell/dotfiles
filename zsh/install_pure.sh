#!/bin/sh
set -e
set -x

PURE_GIT_URL="https://github.com/sindresorhus/pure.git"

git clone ${PURE_GIT_URL} "${DOTFILES_ZSH}"

:<<!
来自:http://www.51testing.com/html/39/45739-179632.html
替换行(c)
函数参数 c 表示改变文件中的资料。其格式如下:
sed [address1[ ,address2]]c\ 使用者所输入的资料
对上述格式有下面几点说明:
函数参数 c 最多与两个位址参数配合，地址位可以使数字表示，如1,5c，也可以使/abc/,/hgj/c,，同时也可以混合的使用，当然也可以使用一个地址位。如果是输入的两位地址中第一位有效，而第2位有效，则把从第一位开始之后的行都进行替换，反之则不进行替换；也就是说会先判断第一位是否有效，有效的话就开始查找第二位，第二位找不到就默认是文件结尾。如果没有地址位，则全部行都被替换。
函数参数 c 紧接着 "\" 字元用来表示此行结束 , 使用者所输入的资料必须从下一行输入。如果资料超过一行 , 则须在 每行的结尾加入"\"。
sed 执行改变动作的情况 : 在 pattern space 内资料输出时 , sed 改变它成为使用者所输入的资料。
其命令列如下
sed -e '5c\    #这里开始要替换的内容就要换行写
Those must often wipe a bloody nose. ' input.dat
例三. 将文件中 1 至 100 行的资料区 , 替换成如下两行资料 :
How are you?
data be deleted!
则其命令列如下
sed -e '1,100c\
How are you?\
data be deleted! ' input.dat
所以c指令要换行
!

# 切换默认主题为空
sed -i "" "/^ZSH_THEME/ c\\
ZSH_THEME=\"\"
" ~/.zshrc

# 写入prompt信息
# 先检查下有没有旧的prompt信息,将它们删除
sed -i "" "\:autoload \-U promptinit\; promptinit:d" ~/.zshrc
sed -i "" "\:prompt pure:d" ~/.zshrc

echo "autoload -U promptinit; promptinit" >> ~/.zshrc
echo "prompt pure" >> ~/.zshrc

# 写入全局fpath
sed -i "" "\:fpath=(~/.local/pure:d" ${OH_MY_ZSH}/oh-my-zsh.sh
echo "fpath=(~/.local/pure \$fpath)" >> ${OH_MY_ZSH}/oh-my-zsh.sh

