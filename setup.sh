#!/bin/bash

CURDIR=`pwd`

if [ -e ~/.vim ]; then
	mv ~/.vim ~/.vim.old
fi

if [ -e ~/.vimrc ]; then
	mv ~/.vimrc ~/.vimrc.old
fi

if [ -e ~/.gvimrc ]; then
	mv ~/.gvimrc ~/.gvimrc.old
fi

ln -s $CURDIR ~/.vim
ln -s $CURDIR/vimrc ~/.vimrc
ln -s $CURDIR/gvimrc ~/.gvimrc

# Necessary directories for various plugins
mkdir $CURDIR/tmp
mkdir $CURDIR/sessions

# setup bundles
git submodule update --init

# setup external programs
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

# command-t needs to be built
cd ~/.vim/bundles/command-t/ruby/command-t/
ruby extconf.rb
make

cd $CURDIR

echo "Installation successfull"
