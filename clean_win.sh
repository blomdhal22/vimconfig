#!/bin/sh

if [ -e ~/.vimrc -o -e ~/.vim ]; then
	echo "Caution: Remove already exist files"
	echo "Remove all files in '~/.vim'"
	rm -rf ~/.vim
	echo "Remove vim config file '~/_vimrc'"
	rm ~/_vimrc
	exit
fi

echo "There are nothing to cleanup files."
