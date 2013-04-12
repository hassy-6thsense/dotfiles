filetype off
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle'))
endif
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'thinca/vim-quickrun'
filetype plugin indent on

set runtimepath+=~/.vim/
runtime! plugins.rc.d/*.vimrc
