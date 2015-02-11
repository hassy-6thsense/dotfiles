let g:vimfiler_as_default_explorer = 1
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_ignore_pattern = '^\%(\.git\|\.DS_Store.*\)$'

nnoremap <silent> <Space>f :VimFiler<CR>
nnoremap <silent> <Space>s :VimFilerSplit<CR>
nnoremap <silent> <Space>e :VimFilerExplorer<CR>
