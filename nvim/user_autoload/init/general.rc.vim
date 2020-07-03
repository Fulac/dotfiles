"---------------------------------------------
" key mapping
"---------------------------------------------
" jf でノーマルモードへ戻る
inoremap jf <Esc>

" 検索のハイライトを解除する ( <Esc><Esc>で )
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" 押しづらいキーを置き換える
nnoremap <Space>h ^
nnoremap <Space>l $
nnoremap <Space>j %

" 単語補完を一覧の逆順にカーソルを動かして行う
inoremap <C-f> <C-p>

" ウィンドウ移動(上、下、左、右、次)
nnoremap fk <C-w>k
nnoremap fj <C-w>j
nnoremap fh <C-w>h
nnoremap fl <C-w>l
nnoremap fw <C-w>w

" タブ移動(次、前)
nnoremap tl gt
nnoremap th gT

" <Leader> を , に割り当てる
let mapleader = ","

" <LocalLeader> を <Space> に割り当てる
let maplocalleader = "\<Space>"
let maplocalleader


"---------------------------------------------
" 補完オプション
"---------------------------------------------
" set completeopt=menuone,preview,noinsert,noselect


"---------------------------------------------
" ファイル処理関連の設定
"---------------------------------------------
" 保存されてないファイルがあるときは終了前に保存確認
set confirm

" 保存されてないファイルがあるときでも別のファイルを開く事ができる
set hidden

" 外部でファイルに変更がされた場合は読み直す
set autoread

" ファイル保存時にバックアップファイルを作らない
set nobackup

" ファイル編集中にスワップファイルを作らない
set noswapfile


"---------------------------------------------
" 検索/置換の設定
"---------------------------------------------
" 検索文字をハイライトする
set hlsearch

" インクリメンタルサーチを行う
set incsearch

" 大文字と小文字を区別しない
set ignorecase

" 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set smartcase

" 最後尾まで検索を終えたら次の検索で先頭に移る
set wrapscan


"---------------------------------------------
" タブ/インデントの設定
"---------------------------------------------
" タブ入力を複数の空白入力に置き換える
set expandtab

" 画面入力でタブ文字が占める幅
set tabstop=2

" 自動インデントでずれる幅
set shiftwidth=2

" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=2

" 改行時に前の行のインデントを継承する
set autoindent


"---------------------------------------------
" 動作環境との統合関連の設定
"---------------------------------------------
" マウスの入力を受け付ける
set mouse=a

" Windows でもパスの入力を / にする
set shellslash


"---------------------------------------------
" ビープの設定
"---------------------------------------------
" ビープ音を全て無効にする
set visualbell t_vb=

" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells


"---------------------------------------------
" 文字コードの自動認識
"---------------------------------------------
set encoding=utf-8
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'

  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'

    " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif

  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif

  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif

" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif

" 改行コードの自動認識
set fileformats=unix,dos,mac

" □とか○の文字があってもカーソル位置がずれないようにする
" Nerdfontsのlightline用区切り文字を使用するとステータスラインがずれるため未設定(2020/6/10)
"if exists('&ambiwidth')
"  set ambiwidth=double
"endif

" 新規のファイルにはutf-8を適用する
set fileencoding=utf-8

