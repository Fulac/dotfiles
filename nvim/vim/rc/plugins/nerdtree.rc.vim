"---------------------------------------------
" nerdtree.vim
"---------------------------------------------
" 隠しファイルを表示する
let NERDTreeShowHidden = 1

" NERDTreeを起動するコマンド
noremap <C-n> :NERDTreeToggle<CR><C-w>w

" NERDTree以外にVimのBufferがない場合、NERDTreeを自動終了する
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 新規タブを開いたときにNERDTreeを自動起動する
autocmd TabNew * call timer_start(0, { -> execute('NERDTree') })
autocmd TabNew * call timer_start(0, { -> feedkeys("\<C-w>w") })

