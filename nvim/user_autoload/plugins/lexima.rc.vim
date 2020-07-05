"---------------------------------------------
" lexima.vim
"---------------------------------------------
" nvim:補完ウィンドウのポップアップを考慮する処理を無効にする
let g:lexima_nvim_accept_pum_with_enter = 0

" 独自のルールを追加するためこのタイミングでdefault_rulesを設定
let g:lexima_no_default_rules = 1
call lexima#set_default_rules()

" <CR>の前に<C-]>を入力 : <C-]>でpopupを消す <- asyncomplete.vim
call lexima#insmode#map_hook('before', '<CR>', "<C-]>")

