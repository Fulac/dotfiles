"---------------------------------------------
" asyncomplete.vim
"---------------------------------------------
" none popup delay (Default: 30 milliseconds)
let g:asyncomplete_popup_delay = 0

" usersetting completeopt
let g:asyncomplete_auto_completeopt = 1

" Tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<Tab>"
inoremap <expr> <C-y>   pumvisible() ? asyncomplete#close_popup() : "\<C-y>"
inoremap <expr> <CR>    pumvisible() ? asyncomplete#close_popup() . "\<CR>" : "\<CR>"

" Force refresh completion
imap <C-Space> <Plug>(asyncomplete_force_refresh)

