#!/bin/sh

if [ -e ~/.vimrc -o -e ~/.vim ]; then
	#echo "경고: 설치를 진행하려면 ~/.vim/ 디렉토리와 ~/.vimrc 파일을 삭제해야 합니다."
	echo "Caution: Remove already exist files"
	echo "Remove all files in '~/.vim'"
	rm -rf ~/.vim
	echo "Remove vim config file '~/.vimrc'"
	rm ~/.vimrc
	exit
fi

echo "There are nothing to cleanup files."
