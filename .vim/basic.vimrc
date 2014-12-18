set nocompatible
set nobackup
set noswapfile
set number
set showmode
set nowrap

set shell=/bin/bash\ -l\ -O\ expand_aliases
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
set showmatch

" Encoding
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,euc-jp,cp932,cp20932,latin1

" Indent & tab
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

let loaded_matchparen=1


function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightred
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif

