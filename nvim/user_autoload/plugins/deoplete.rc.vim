"---------------------------------------------
" deoplete.nvim
"---------------------------------------------
" <TAB>: completion.
inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" <TAB>で選んで<Enter>で確定時に改行しない
inoremap <expr><CR> pumvisible() ? deoplete#close_popup() : "<CR>"

