#vimconfig

vim 플러그인을 쉽게 설치하기 위한 프로젝트.

사용된 자원

- Bundle
- Bash script
- 2015-01-09, Bundle이 Vundle로 변경되었으며, 업데이트 내용을 적용했습니다.
- 2015-08-03, gVim파일과 설정 내용을 업데이트 했습니다.


INSTALL / CLEAN
-------

### 1. Linux

```vim
<Install>
$ git clone https://github.com/blomdhal/vimconfig.git ~/vimconfig
$ ~/vimconfig/install.sh

<Clean>
$ ~/vimconfig/install.sh
```

### 2. Windows

```vim
$ git clone https://github.com/blomdhal/vimconfig.git ~/vimconfig
$ ~/vimconfig/install_win.sh

<Clean>
$ ~/vimconfig/install_win.sh
```


디렉토리 구조
-----------


|    이름    |            내용                                                 |
| ---------- | --------------------------------------------------------------- |
| /snippets  | SnipMate 플러그용 snippets (자동 설치 미지원)                   |
| /plugins   | 커스텀 플러그인 <br/> vimrc에서 'source' 명령으로 이 디렉토리의 파일들을 incldue한다.  |
| README.md  | 지금 읽고 있는 파일                                             |
| install.sh | 설치파일 <br/>  ~/.vimrc 파일과 ~/.vim/ 를 생성한다.            |
| vimrc      | ~/.vimrc -> ~/vimconfig/vimrc                                   |



유용한 vim 명령어
---------------

	[ + I				같은 파일에서 심볼 위치 검색
	:set fileencoding=utf-8		파일 인코딩 변경
	v]}zf				코드의 { 부분에서 영역 접기
	zo				영역 펼치기

Trouble Shooting
----------------

### Windows gVim 설치 시 유의점

기본내용은 아래를 참고
https://github.com/VundleVim/Vundle.vim/wiki/Vundle-for-Windows

vim 설치파일 위치를 vimfiles으로 함으로써, 오류 및 삽질 발생

```vim
<수정전>
set rtp+=~/vimfiles/bundle/Vundle.vim
let path='~/vimfiles/bundle'

<수정후>
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
let path='~/.vim/bundle'
```

> Vundle 설치 폴더와 _vimrc파일의 내용이 일치해야한다.