"---------------------------------------------
" vim-lsp
"---------------------------------------------
" vim-lspの各種オプション設定
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_virtual_text_enabled = 1
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}
let g:lsp_signs_information = {'text': 'i'}
let g:lsp_signs_hint = {'text': '?'}

" " 定義ジャンプ(デフォルトのctagsによるジャンプを上書きしているのでこのあたりは好みが別れます)
" nnoremap <C-]> :<C-u>LspDefinition<CR>
" " 定義情報のホバー表示
" nnoremap K :<C-u>LspHover<CR>
" " 名前変更
" nnoremap <LocalLeader>R :<C-u>LspRename<CR>
" " 参照検索
" nnoremap <LocalLeader>n :<C-u>LspReferences<CR>
" " Lint結果をQuickFixで表示
" nnoremap <LocalLeader>f :<C-u>LspDocumentDiagnostics<CR>
" " テキスト整形
" nnoremap <LocalLeader>s :<C-u>LspDocumentFormat<CR>
" オムニ補完を利用する場合、定義の追加
set omnifunc=lsp#complete


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

" pylsコマンドのPathを指定
let s:pyls_path = $PYENV_ROOT.'/shims/pyls'

" pylsの起動定義
if (executable('pyls'))
  augroup LspPython
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'pyls',
      \ 'cmd': { server_info -> [expand(s:pyls_path)] },
      \ 'whitelist': ['python'],
      \ 'workspace_config': s:pyls_config
      \})
  augroup END
endif

" .pyを開いたときにLSPを起動
augroup LaunchPyls
  autocmd!
  autocmd BufWinEnter *.py :call lsp#enable()
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
      \ 'whitelist': ['c', 'cpp'],
      \})
  augroup END
endif

" .c,.cppを開いたときにLSPを起動
augroup LaunchClangd
  autocmd!
  autocmd BufWinEnter *.c   :call lsp#enable()
  autocmd BufWinEnter *.cpp :call lsp#enable()
augroup END

