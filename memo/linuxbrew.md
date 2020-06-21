## Linuxbrewのインストール
  + 事前に以下のパッケージを用意  
    ( Debian系 )  
      `sudo apt-get install build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev gettext`  
    ( RHEL系 )  
      `sudo yum groupinstall 'Development Tools' && sudo yum install curl git m4 ruby texinfo bzip2-devel curl-devel expat-devel ncurses-devel zlib-devel openssl-devel`

  + rubyも入っていなければ用意する

  + インストール  
      `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"`

  + .zshrcに以下を記載  
      `export PATH="$HOME/.linuxbrew/bin":$PATH`  
      `export MANPATH="$HOME/.linuxbrew/share/man":$MANPATH`  
      `export INFOPATH="$HOME/.linuxbrew/share/info":$INFOPATH`  
      `export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib":$LD_LIBRARY_PATH`  

  + 最後に  
      `brew update`  
      `brew doctor`  


## 使い方
  + インストール  
      `brew install formula`  

  + インストール時のオプションを確認
      `brew options formula`  

  + アップデート  
      `brew update`

  + 古くなったformulaを一括アップグレード  
      `brew upgrade`

  + 古くなったformulaを一括削除  
      `brew cleanup`
