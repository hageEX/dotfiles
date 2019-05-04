#!/bin/sh

if [ ! -f ~/.vim/autoload/plug.vim ] ; then
    echo 'Install... [vim-plug]'
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ ! -f ~/.vim/colors/despacio.vim ] ; then
    echo 'Install... [despacio.vim]'
    curl -fLo ~/.vim/colors/despacio.vim --create-dirs \
        https://raw.githubusercontent.com/AlessandroYorba/Despacio/master/colors/despacio.vim
fi

echo 'Add... [.vimrc]\n'
echo 'source ~/dotfiles/dot.vimrc' >> ~/.vimrc
echo 'Add... [.zshrc]\n'
echo 'source ~/dotfiles/dot.zshrc' >> ~/.zshrc

echo '__Finally__'
echo '$ vim'
echo ':PlugInstall\n'

echo 'Welcome to vim!'
