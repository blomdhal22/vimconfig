#!/bin/sh

if [ -e ~/.vimrc -o -e ~/.vim ]; then
	echo "Error!: Please Remove '~/.vim/' directory and  '~/.vimrc' file."
	exit
fi

echo "Copy vimrc to '~/.vimrc'..."
#ln -sfv ~/vimconfig/vimrc ~/.vimrc
cp ~/vimconfig/vimrc ~/.vimrc

#echo "vundle 다운로드중..."
echo "Downloading vundle..."
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Install vundle..."
vim +PluginInstall +qall
echo "Install completed."
