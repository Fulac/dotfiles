" clang コマンドの設定
let g:marching_clang_command = "clang"

" オプションを追加する場合
let g:marching_clang_command_option = {
\   "cpp" : "-std=gnu++1y"
\}

" インクルードディレクトリパスを設定
let g:marching_include_paths = [
\   "/usr/include/c++/5"
\]

" neocomplete.vim と併用して使用する場合の設定
let g:marching_enable_neocomplete = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.cpp =
\   '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" 処理のタイミングを制御する
" 短いほうがより早く補完ウィンドウが表示される
" ただし、marching.vim 以外の処理にも影響するため注意
set updatetime = 200

" オムニ補完時に補完ワードを挿入したくない場合
imap <buffer> <C-x><C-o> <Plug>(marching_start_omni_complete)

" キャッシュを削除してからオムニ補完を行う
imap <buffer> <C-x><C-x><C-o> <Plug>(marching_force_start_omni_complete)

