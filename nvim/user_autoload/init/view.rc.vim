"---------------------------------------------
" vimの色関係
"---------------------------------------------
syntax on

" ターミナルタイプによるカラー設定
if &term =~ "xterm-256color" || "screen-256color"
  " 256色
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" ハイライト on
syntax enable

" 補完候補の色づけ for vim7
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c


"---------------------------------------------
" 画面表示の設定
"---------------------------------------------
" 行番号を表示する
set number

" ステータス行を常に表示
set laststatus=2

" メッセージ表示欄を２行確保
set cmdheight=2

" 対応する括弧を強調表示
set showmatch

" 対応括弧の表示秒数３秒
set matchtime=3

" ヘルプを画面一杯に開く
set helpheight=999

" 不可視文字を表示
set list

" 不可視文字の表示記号設定
set listchars=extends:',precedes:'

" モードの表示を消す
set noshowmode


"---------------------------------------------
" カーソル移動関連の設定
"---------------------------------------------
" Backspaceキーの影響範囲に制限を設けない
set backspace=indent,eol,start

" 行頭行末の左右移動で行をまたぐ
set whichwrap=b,s,h,l,<,>,[,]

" 上下８行の視界確保
set scrolloff=8

" 左右スクロール時の視界を確保
set sidescrolloff=16

" 左右スクロールは１文字づつ行う
set sidescroll=1

