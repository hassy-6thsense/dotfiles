let g:neocomplcache_enable_at_startup = 1	"起動時に有効	
let g:neocomplcache_auto_completion_start_length = 2	"自動補完を行う入力数
let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'	"スニペットの保存ディレクトリ
"let g:neocomplcache_enable_quick_match = 0	"クイックマッチを有効に(現行verでは動かない)
"オムニ補完を有効に
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"スニペット補完へのマッピング
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
"スニペット補完をtabで行えるようにする
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"スニペット編集へのキーマッピング
noremap nes :<C-u>NeoComplCacheEditSnippets<CR>

