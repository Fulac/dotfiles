"---------------------------------------------
" vim-lsp
"---------------------------------------------
" vim-lspの各種オプション設定
let g:lsp_signs_enabled           = 0
let g:lsp_diagnostics_enabled     = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_virtual_text_enabled    = 1

" signのアイコンを設定( 行番号表示の幅が動いて煩わしいので現状非表示 )
let g:lsp_signs_error       = {'text': "\uf467"}
let g:lsp_signs_warning     = {'text': "\uf071"}
let g:lsp_signs_information = {'text': "\uf05a"}
let g:lsp_signs_hint        = {'text': "\uf400"}

" 定義表示
nnoremap <LocalLeader>d :<C-u>LspPeekDefinition<CR>

" 定義情報のホバー表示
nnoremap <LocalLeader>k :<C-u>LspHover<CR>

" 名前変更
nnoremap <LocalLeader>r :<C-u>LspRename<CR>

" 参照検索
nnoremap <LocalLeader>n :<C-u>LspReferences<CR>

" Lint結果をQuickFixで表示
nnoremap <LocalLeader>f :<C-u>LspDocumentDiagnostics<CR>

" テキスト整形
nnoremap <LocalLeader>s :<C-u>LspDocumentFormat<CR>


"---------------------------------------------
" pyls
"---------------------------------------------
" LinterのON/OFFなどが可能
let s:pyls_config = {'pyls': {'plugins': {
  \   'pycodestyle': {'enabled': v:true},
  \   'pydocstyle': {'enabled': v:false},
  \   'pylint': {'enabled': v:false},
  \   'flake8': {'enabled': v:true},
  \   'jedi_definition': {
  \     'follow_imports': v:true,
  \     'follow_builtin_imports': v:true,
  \   },
  \ }}}


" pylsの起動定義
if (executable('pyls'))
  " pylsコマンドのPathを指定
  let s:pyls_path = $PYENV_ROOT.'/shims/pyls'

  augroup LspPython
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'pyls',
      \ 'cmd': { server_info -> [expand(s:pyls_path)] },
      \ 'allowlist': ['python'],
      \ 'workspace_config': s:pyls_config
      \})

    autocmd FileType python setlocal omnifunc=lsp#complete
  augroup END
endif

" .pyを開いたときにLSPを起動
augroup LaunchPyls
  autocmd!
  autocmd FileType python :call lsp#enable()
augroup END


"---------------------------------------------
" clangd
"---------------------------------------------
" clangdの起動定義
if (executable('clangd'))
  augroup LspClangd
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'clangd',
      \ 'cmd': { server_info -> ['clangd'] },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
      \})

    autocmd FileType c      setlocal omnifunc=lsp#complete
    autocmd FileType cpp    setlocal omnifunc=lsp#complete
    autocmd FileType objc   setlocal omnifunc=lsp#complete
    autocmd FileType objcpp setlocal omnifunc=lsp#complete
  augroup END
endif

" C, C++等を開いたときにLSPを起動
augroup LaunchClangd
  autocmd!
  autocmd FileType c      :call lsp#enable()
  autocmd FileType cpp    :call lsp#enable()
  autocmd FileType objc   :call lsp#enable()
  autocmd FileType objcpp :call lsp#enable()
augroup END


"---------------------------------------------
" rls
"---------------------------------------------
if executable('rls')
  augroup LspRls
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'rls',
            \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
            \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
            \ 'whitelist': ['rust'],
            \ })
    augroup END
endif

augroup LaunchRls
  autocmd!
  autocmd FileType rust call lsp#enable()
augroup END

