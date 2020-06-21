"---------------------------------------------
" unite
"---------------------------------------------
" インサートモードで開始する
let g:unite_enable_start_insert = 1

" 最近開いたファイル履歴の保存数 (設定:50)
let g:unite_source_file_mru_limit = 50

" file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()

function! s:unite_my_settings()
  "ESCでuniteを終了
  nmap <buffer> <ESC> <Plug>(unite_exit)

  "入力モードのときjfでノーマルモードに移動
  imap <buffer> jf <Plug>(unite_insert_leave)

  "入力モードのときctrl+wでバックスラッシュも削除
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)

  "ctrl+jで横に分割して開く
  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')

  "ctrl+lで縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')

  "ctrl+oでその場所に開く
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction

"unite.vimを縦分割で開始
let g:unite_enable_split_vertically = 1
