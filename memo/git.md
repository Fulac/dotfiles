## 最新版のgitをソースからインストールする
  + ソースをダウンロードする
    `git clone git://git.kernel.org/pub/scm/git/git.git`

  + インストール  
    `make prefix=/usr/local all`  
    `sudo make prefix=/usr/local install`

    prefixのPathを変更することで任意のディレクトリにインストール可能(未確認)  
    Pathの通っていないディレクトリなら, そこへPathを通すことを忘れない
