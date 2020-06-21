## vimのインストール
1. brewを使ってインストール  
  + `brew options vim`で必要なオプションを見てから`brew install vim`

2. vim をソースからコンパイルする
  + 事前に以下のライブラリをインストールする  
    `gcc gfortran g++ make openssl mercurial gettext libncurses5-dev libxmu-dev`

  + osのシステムにpython, python3, ruby, perl, lua, luajitをインストールしておく  
    `python python3 ruby perl lua luajit`

  + python, ruby, perl, luaのオプションを有効にするために以下のライブラリをインストールする  
    `python-dev python3-dev ruby-dev libperl-dev liblua5.2-dev libluajit-5.1-dev`

  + githubからソースをダウンロードする  
    `git clone https://github.com/vim/vim.git`  
    更新する  
    `git pull`

  + configure, makeをしてvimのインストールを行う  
    `./configure --with-features=huge --enable-multibyte --enable-gui=no --enable-perlinterp --enable-pythoninterp=dynamic --enable-python3interp=dynamic --enable-rubyinterp=dynamic --enable-luainterp=dynamic --with-lua-prefix=/usr --with-luajit --enable-cscope --enable-xim --enable-fail-if-missing`  
    `make`  
    `sudo make install`

    `${HOME}/local`にvimをインストールする場合は`./configure`に`--prefix=${HOME}/local`を追加

    luaに関してエラーが出る場合は`./configureの--enable-luainterp=dynamic`部分の`=dynamic`を除いていみる
