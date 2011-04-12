#!/bin/bash

if [ -e ~/.vim ]; then
	mv ~/.vim ~/.vim.old
fi

if [ -e ~/.vimrc ]; then
	mv ~/.vimrc ~/.vimrc.old
fi

if [ -e ~/.gvimrc ]; then
	mv ~/.gvimrc ~/.gvimrc.old
fi

ln -s . ~/.vim
ln -s vimrc ~/.vimrc
ln -s gvimrc ~/.gvimrc

ZSH=`which zsh`
CTAGS=`which ctags`
CSCOPE=`which cscope`

cat >~/.vim/external.vim <<EOL
set shell=$ZSH
" let Tlist_Ctags_Cmd = "$CTAGS"

let g:showfuncctagsbin = "$CTAGS"

if has("cscope")
	set csprg=$CSCOPE
endif
EOL

CURDIR=`pwd`
cd ~/.vim/bundles/command-t/ruby/command-t/
ruby extconf.rb
make

cd $CURDIR

echo "Installation successfull"
