"---------------------------------------------
" nvim-lsp
"---------------------------------------------
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <LocalLeader>d <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <LocalLeader>r <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <LocalLeader>k <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <LocalLeader>n <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>


"---------------------------------------------
" pyls
"---------------------------------------------
if (executable('pyls'))
  lua require'nvim_lsp'.pyls.setup{}
  autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
endif

