"---------------------------------------------
" dein.vim set up
"---------------------------------------------
" dein.vimのディレクトリ
let s:dein_dir      = expand($XDG_CONFIG_HOME . '/nvim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ git clone する
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif

" dein.vimのPathをruntimepathに追加する(前に挿入)
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " 管理するプラグインを記述したファイル
  let s:toml      = $XDG_CONFIG_HOME . '/nvim/user_autoload/dein.toml'
  let s:lazy_toml = $XDG_CONFIG_HOME . '/nvim/user_autoload/deinlazy.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" vimprocを優先的にインストールする. 最近はいらないかもしれないのでコメントアウト
" let s:vimproc_dir = s:dein_dir . '/repos/github.com/Shougo/vimproc.vim'
" if has('vim_starting') && !isdirectory(s:vimproc_dir)
"   call dein#install(['vimproc'])
" endif

" プラグインの追加・削除やtomlファイルの設定を変更した後は
" 適宜 'call dein#update()' や 'call dein#clear_state()' を呼ぶ

" 未インストールのプラグインをインストールする
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on

