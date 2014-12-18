set nocompatible
set shell=/bin/bash\ -l\ -O\ expand_aliases
set number
set smartindent
set cindent
set showmode
set whichwrap=b,s,h,l,<,>,[,]
set nowrap
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set showmatch
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,euc-jp,cp932,cp20932,latin1
set nobackup
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

