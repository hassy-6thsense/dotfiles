let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=darkblue
hi IndentGuidesEven ctermbg=darkgray
nnoremap <silent> <Space>i :IndentGuidesToggle<CR>
