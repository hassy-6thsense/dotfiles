"**************************************************
" Disable filetype settings at first
"**************************************************

filetype off
filetype plugin indent off


"**************************************************
" Enable syntax
"**************************************************

syntax on


"**************************************************
" Plugins
"**************************************************

if filereadable( expand( '~/.vim/neobundle.vimrc' ) ) && filereadable( expand( '~/.vim/bundle/neobundle.vim/README.md' ) )
    source ~/.vim/neobundle.vimrc
else
    echo "Type 'git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim'."
endif


"**************************************************
" Basic settings
"**************************************************

set number
set showmode
set nowrap
set shell=/bin/bash\ -l\ -O\ expand_aliases
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
set showmatch
set hlsearch


"**************************************************
" Backup
"**************************************************

" Create backup directory if not exist
if !isdirectory(expand('~/.cache/vim'))
    call mkdir(expand('~/.cache/vim'), 'p', 0700)
endif

" Swap file
set swapfile
set directory=~/.cache/vim

" Backup file
set backup
set backupdir=~/.cache/vim

" Undo file
if has('persistent_undo')
    set undofile
    set undodir=~/.cache/vim
endif


"**************************************************
" Color
"**************************************************

" Individual settings
autocmd ColorScheme * highlight DiffAdd    ctermfg=255 ctermbg=28
autocmd ColorScheme * highlight DiffChange ctermfg=255 ctermbg=20
autocmd ColorScheme * highlight DiffDelete ctermfg=255 ctermbg=88
autocmd ColorScheme * highlight DiffText   ctermfg=255 ctermbg=136 cterm=bold
autocmd ColorScheme * highlight Comment    ctermfg=243

" Select colorscheme
colorscheme pablo


"**************************************************
" Encoding
"**************************************************

set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,euc-jp,cp932,cp20932,latin1


"**************************************************
" Cursor-keys
"   http://vim-jp.org/vimdoc-ja/term.html#xterm-cursor-keys
"**************************************************

set notimeout
set ttimeout
set timeoutlen=100
let loaded_matchparen=1


"**************************************************
" Indent and tab
"**************************************************

" Common settings
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Individual settings
autocmd FileType html           setlocal softtabstop=2 shiftwidth=2
autocmd FileType javascript     setlocal softtabstop=2 shiftwidth=2
autocmd FileType json           setlocal softtabstop=2 shiftwidth=2
autocmd FileType yaml           setlocal softtabstop=2 shiftwidth=2


"**************************************************
" Character manipulation
"**************************************************

" Highlight invisible characters
function! HighlightInvisbleChars()
    highlight default IdeographicSpace cterm=underline gui=underline ctermfg=yellow guifg=yellow
    highlight default Tab ctermbg=green guibg=green
    highlight default link TrailingWhitespace SpellBad
endfunction
augroup HighlightInvisibleChars
    autocmd!
    autocmd ColorScheme * call HighlightInvisbleChars()
    autocmd VimEnter,WinEnter,BufNew,BufRead * let w:m1=matchadd('IdeographicSpace', '　')
    autocmd VimEnter,WinEnter,BufNew,BufRead * let w:m2=matchadd('Tab', '\t')

    " Highlight trailing whitespace, but disable in insert mode
    " (pattern 'a\_$b' never matches)
    autocmd VimEnter,WinEnter,BufNew,BufRead,InsertLeave * match TrailingWhitespace /\\\@<![\u3000[:space:]]\+$/
    autocmd InsertEnter * match TrailingWhitespace /a\_$b/
augroup END
call HighlightInvisbleChars()

" Functions for remove trailing whitespace
function! s:RemoveTrailingWhitespace(line1, line2)
    let l:save_cursor = getpos('.')
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\v(\s|　)+$//'
    call setpos('.', l:save_cursor)
endfunction

" Register command ':RemoveTrailingWhitespace'
command! -range=% RemoveTrailingWhitespace call <SID>RemoveTrailingWhitespace(<line1>, <line2>)

" Disable conceal
set conceallevel=0
set concealcursor=


"**************************************************
" Key mappings
"**************************************************

" Shortcut keys
nnoremap <F2> :noh<CR>
nnoremap <F3> :set paste!<CR>:set paste?<CR>
nnoremap <F4> :set expandtab!<CR>:set expandtab?<CR>
nnoremap <F5> :RemoveTrailingWhitespace<CR>

" Very magic search
nnoremap / /\v
nnoremap ? ?\v
nnoremap * *\v
nnoremap # #\v
nnoremap :%s/ :%s/\v


"**************************************************
" Enable filetype settings again at last
"**************************************************

filetype plugin indent on
