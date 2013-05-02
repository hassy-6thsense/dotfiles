filetype off
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle'))
endif

let github = 'https://github.com/'
NeoBundle g:github . 'Shougo/unite.vim'
NeoBundle g:github . 'Shougo/neocomplcache'
NeoBundle g:github . 'Shougo/neosnippet'
NeoBundle g:github . 'Shougo/vimfiler'
NeoBundle g:github . 'kana/vim-smartchr'
NeoBundle g:github . 'thinca/vim-quickrun'
NeoBundle g:github . 'vim-scripts/sudo.vim'
NeoBundle g:github . 'mattn/zencoding-vim'
filetype plugin indent on

set runtimepath+=~/.vim/
runtime! plugins.rc.d/*.vimrc
