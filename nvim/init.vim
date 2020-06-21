"---------------------------------------------
" initialize
"---------------------------------------------
" vi との互換性を断つ
if &compatible
  set nocompatible
endif

" source 読み込み
function! s:source_rc(path)
  execute 'source' fnameescape($XDG_CONFIG_HOME . '/nvim/vim/rc/' . a:path)
endfunction


"---------------------------------------------
" general setting
"---------------------------------------------
call s:source_rc('general.rc.vim')


"---------------------------------------------
" view
"---------------------------------------------
call s:source_rc('view.rc.vim')


"---------------------------------------------
" dein.vim
"---------------------------------------------
call s:source_rc('dein.rc.vim')


"---------------------------------------------
" os毎の設定を読み込む
"---------------------------------------------
if has('win64')
  let OSTYPE = "Windows\n"
else
  let OSTYPE = system('uname')
endif

if OSTYPE == "Linux\n"
  call s:source_rc('linux.rc.vim')
elseif OSTYPE == "CYGWIN*\n"
  call s:source_rc('cygwin.rc.vim')
elseif OSTYPE == "Darwin\n"
  call s:source_rc('osx.rc.vim')
elseif OSTYPE == "Windows\n"
  call s:source_rc('Windows.rc.vim')
endif

