"---------------------------------------------
" asyncomplete.vim
"---------------------------------------------
" Tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<Tab>"
inoremap <expr> <Cr>    pumvisible() ? "\<C-y>" : "\<Tab>"

" Force refresh completion
imap <c-space> <Plug>(asyncomplete_force_refresh)

