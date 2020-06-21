## zshをインストールする
1. brewを使う  
  + `brew install zsh`

2. ソースからコンパイルする
  + 下のページからソースを手に入れる  
    http://zsh.sourceforge.net/Arc/source.html

  + configure, makeをしてzshのインストールを行う  
    `./configure --enable-multibyte --enable-locale`  
    `make`  
    `sudo make install`  

    `${HOME}/local` にzshをインストールする場合は `./configure` に `--prefix=${HOME}/local` を追加
