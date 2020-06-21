"---------------------------------------------
" ノーマルモードと挿入モードでカーソルの形状を変更する (iterm限定)
"---------------------------------------------
" iterm限定 & screen使用時も使えるように分岐
" http://blog.remora.cx/2012/10/spotlight-cursor-line.html を参照
if &term =~ "screen"
  let &t_SI = "\eP\e]50;CursorShape=1\x7\e\\"
  let &t_EI = "\eP\e]50;CursorShape=0\x7\e\\"
elseif &term =~ "xterm"
  let &t_SI = "\e]50;CursorShape=1\x7"
  let &t_EI = "\e]50;CursorShape=0\x7"
endif

