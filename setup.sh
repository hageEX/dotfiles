#!/bin/sh


if [ ! -f ~/.vim/autoload/plug.vim ] ; then
    echo 'Install... [vim-plug]'
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    if [ $? = 0 ] ; then
        echo '\n[+]Install... vim-plug'
    else
        printf '[*]\e[33mWarning not install curl. \e[0m\n'
    fi
fi

if [ ! -f ~/.vim/colors/despacio.vim ] ; then
    echo '[+]Install... despacio.vim'
    curl -fLo ~/.vim/colors/despacio.vim --create-dirs \
        https://raw.githubusercontent.com/AlessandroYorba/Despacio/master/colors/despacio.vim
    if [ $? = 0 ] ; then
        echo '\nInstall... [despacio.vim]'
    else
        printf '[*]\e[33mWarning not install curl. \e[0m\n'
    fi
fi


read -p "Add link to vimrc & zshrc [y/N] " keyborad
case $keyborad in
    [Yy] )
        echo '\n[+]Add  >> .vimrc'
        echo 'source ~/dotfiles/dot.vimrc' >> ~/.vimrc
        echo '[+]Add  >> .zshrc'
        echo 'source ~/dotfiles/dot.zshrc' >> ~/.zshrc
        echo 'vim'
        echo ':PlugInstall\n'
        ;;
    * )
        ;;
esac
echo 'Complete.'
