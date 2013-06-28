"==
"= 주의사항
"==
"  - source ~/vimrc/vundle은 맨 처음 올 것.
"  - BundleInstall로 설치한 플러그인은 ~/vimrc/vundle 파일에 추가해야 다음번
"    실행시 로드됨
"  - Source Explorer의 충돌을 피하기 위해서 SrcExpl_pluginList를 새로 작성
"  - 

"==
"= include
"==
source ~/vimconfig/config_vundle
source ~/vimconfig/config_taglist_plugin 
source ~/vimconfig/config_nerd_tree_plugin 
source ~/vimconfig/config_man

"==
"= 기본 설정
"==
set cindent			"들여쓰기 설정
"set bg=dark
set ruler			" 화면 우측 하단에 현재 커서의 위치(줄,칸)를 보여준다.
set number			" 줄번호 출력
set modifiable
set hlsearch			" Highlight Search
set ts=8			" tab stop - tab 크기
set sw=8			" shift width - shift 크기 조절
set sts=8			" soft tab stop - tab 이동 크기
set incsearch
set ignorecase
set printoptions=portrait:n,wrap:n,duplex:off
set fileencodings=utf-8,euc-kr
set gfn=나눔고딕코딩\ 10	" gvim용 폰트 설정

let g:molokai_original = 1
let g:rehash256 = 1
set background=dark
colorscheme molokai		" 색상

"==
"= tags 등록
"==
set tags=./tags
set tags+=/home/ygpark/bin/ndk/platforms/android-14/arch-arm/usr/include/tags
"set tags+=~/repo/iamroot-linux-arm10c/tags
"set tags+=~/.vimtags/cpp


"========= key mapping ==========
" 펑션키: F1 ~ F12
map <F2> v]}zf				"코드의 { 부분에서 영역 접기
map <F3> zo				"영역 펼치기
map <F4> :set fileencoding=utf-8<cr>	"파일 인코딩 변경
map <F5> :!./build.sh<cr>
map <F6> :BufExplorer<cr>
map <F7> :SrcExplToggle<CR> 
map <F8> :NERDTreeToggle<CR>
map <F9> :TlistToggle<CR>

" PageUP PageDown
map <PageUp> <C-U><C-U>
map <PageDown> <C-D><C-D>

"Vim 내의 창 크기 조절
nmap <s-h> <C-W><
nmap <s-j> <C-W>-
nmap <s-k> <C-W>+
nmap <s-l> <C-W>>

"Vim 내에서 창 간 이동
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j 
nmap <c-k> <c-w>k 
nmap <c-l> <c-w>l 

"========= switch between file buffers ========
map ,x :bn!<CR>	  " Switch to Next File Buffer
map ,z :bp!<CR>	  " Switch to Previous File Buffer
map ,w :bw<CR>	  " Close Current File Buffer

map ,1 :b!1<CR>	  " Switch to File Buffer #1
map ,2 :b!2<CR>	  " Switch to File Buffer #2
map ,3 :b!3<CR>	  " Switch to File Buffer #3
map ,4 :b!4<CR>	  " Switch to File Buffer #4
map ,5 :b!5<CR>	  " Switch to File Buffer #5
map ,6 :b!6<CR>	  " Switch to File Buffer #6
map ,7 :b!7<CR>	  " Switch to File Buffer #7
map ,8 :b!8<CR>	  " Switch to File Buffer #8
map ,9 :b!9<CR>	  " Switch to File Buffer #9
map ,0 :b!0<CR>	  " Switch to File Buffer #0



"-----------------------------"
"Source Explorer config
"The switch of the Source Explorer 

let g:SrcExpl_winHeight = 8 
let g:SrcExpl_refreshTime = 100 
let g:SrcExpl_jumpKey = "<ENTER>" 
let g:SrcExpl_gobackKey = "<SPACE>" 
" 충돌을 피하기 위해서 Source Explorer는 buffer는 사용하는 플러그인을 알아야 합니다.
" 이 목록은 taglist, NERD Tree, Source Exploerer를 모두 띄어놓은 상태에서
" ":buffers!"명령을 내려서 나오는 이름들을 적어주세요.
let g:SrcExpl_pluginList = [ 
				\ "__Tag_List__", 
				\ "NERD_tree_1", 
				\ "Source_Explorer" 
				\ ] 

let g:SrcExpl_searchLocalDef = 1 

" // Do not let the Source Explorer update the tags file when opening 
let g:SrcExpl_isUpdateTags = 0 

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
" //  create/update a tags file 
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
let g:SrcExpl_updateTagsKey = "<F12>" 

"-----------------------------"










"====,mk===== make setting =============
let startdir = getcwd()
func! Make()
	exe "!cd ".startdir
	exe "make"
endfunc
nmap ,mk :call Make()<cr><cr>

"====,h====== hexViewer setting =============
let b:hexViewer = 0
func! Hv()
        if (b:hexViewer == 0)
                let b:hexViewer = 1
                exe "%!xxd"
        else
                let b:hexViewer = 0
                exe "%!xxd -r"
        endif
endfunc
nmap ,h :call Hv()<cr>

"============ file buffer CleanClose =============
func! CleanClose(tosave)
if (a:tosave == 1)
	w!
endif
let todelbufNr = bufnr("%")
let newbufNr = bufnr("#")
if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
	exe "b".newbufNr
else
	bnext
endif

if (bufnr("%") == todelbufNr)
	new
endif
	exe "bd".todelbufNr
endfunc

nmap ,cf :call CleanClose(0)<cr>

"============ open CWD =============
nmap ,od :e ./<cr>


"============ project specific settings =============
if filereadable(".project.vimrc")
	source .project.vimrc
endif
"==================================




"========= OmniCppComplete =======
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
" configure tags - add additional tags here or comment out not-used ones
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
"==================================