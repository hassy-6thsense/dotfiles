let g:vimfiler_as_default_explorer = 1
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_ignore_pattern = '^\%(\.git\|\.DS_Store.*\)$'

"IDEのエクスプローラ風で開く
nnoremap <Space>f :VimFilerExplorer -simple -winwidth=30 -no-quit<CR>
autocmd! FileType vimfiler call s:my_vimfiler_settings()
function! s:my_vimfiler_settings()
  nmap     <buffer><expr><CR> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nnoremap <buffer> s :call vimfiler#mappings#do_action('my_split')<CR>
  nnoremap <buffer> v :call vimfiler#mappings#do_action('my_vsplit')<CR>
  nnoremap <buffer> <Space>f :q<CR>
endfunction

"s打鍵でsplitで開き，vimfilerを閉じる
let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  exec 'q'
  wincmd p
  exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', my_action)

"v打鍵でvsplitで開き，vimfilerを閉じる
let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  exec 'q'
  wincmd p
  exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', my_action)
