" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Change protocol to 'https' from 'git'
let github = 'https://github.com/'

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch g:github . 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle g:github . 'Shougo/unite.vim'
NeoBundle g:github . 'Shougo/neomru.vim'
NeoBundle g:github . 'Shougo/neocomplete'
NeoBundle g:github . 'Shougo/neosnippet'
NeoBundle g:github . 'Shougo/neosnippet-snippets'
NeoBundle g:github . 'Shougo/vimfiler.vim'
NeoBundle g:github . 'Shougo/vimshell'
NeoBundle g:github . 'Shougo/vimproc.vim', {
    \ 'build' : {
        \ 'windows' : 'tools\\update-dll-mingw',
        \ 'cygwin' : 'make -f make_cygwin.mak',
        \ 'mac' : 'make -f make_mac.mak',
        \ 'linux' : 'make',
        \ 'unix' : 'gmake',
    \ },
\ }
NeoBundle g:github . 'kana/vim-smartchr'
NeoBundle g:github . 'thinca/vim-quickrun'
NeoBundle g:github . 'mattn/emmet-vim'
NeoBundle g:github . 'deton/jasegment.vim'
NeoBundle g:github . 'bronson/vim-trailing-whitespace'
NeoBundle g:github . 'tpope/vim-surround'
NeoBundle g:github . 'nathanaelkane/vim-indent-guides'
NeoBundle g:github . 'derekwyatt/vim-scala'

call neobundle#end()

" Required:
filetype plugin indent on

" Include plugin's .vimrc files.
runtime! plugins.rc.d/*.vimrc

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
