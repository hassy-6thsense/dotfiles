" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" from http://kazuph.hateblo.jp/entry/2013/01/19/193745
" <TAB>: completion.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" from http://kazuph.hateblo.jp/entry/2013/01/19/193745
" SuperTab like snippets behavior.
imap <expr><TAB> pumvisible() ?
    \ "\<C-n>" :
    \ neosnippet#jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)" :
        \ "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" :
    \ "\<TAB>"
"imap <expr><Space> neosnippet#expandable_or_jumpable() ?
"    \ "\<Plug>(neosnippet_expand_or_jump)" :
"    \ "\<Space>"
imap <expr><CR> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" :
    \ "\<CR>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=0 concealcursor=
endif
