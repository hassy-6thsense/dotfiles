filetype off
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle'))
endif

let github = 'https://github.com/'
NeoBundle g:github . 'Shougo/unite.vim'
NeoBundle g:github . 'Shougo/neocomplete'
NeoBundle g:github . 'Shougo/neosnippet'
NeoBundle g:github . 'Shougo/neosnippet-snippets'
NeoBundle g:github . 'Shougo/vimfiler'
NeoBundle g:github . 'Shougo/vimshell'
NeoBundle g:github . 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle g:github . 'kana/vim-smartchr'
NeoBundle g:github . 'thinca/vim-quickrun'
NeoBundle g:github . 'vim-scripts/sudo.vim'
NeoBundle g:github . 'mattn/zencoding-vim'
NeoBundle g:github . 'deton/jasegment.vim'
"NeoBundle g:github . 'docteurklein/vim-symfony'
filetype plugin indent on

set runtimepath+=~/.vim/
runtime! plugins.rc.d/*.vimrc
