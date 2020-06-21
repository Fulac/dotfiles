## pyenvでpythonをインストールする
  + 事前に以下のパッケージをインストールする  
    `gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev tk-dev python-tk python3-tk`

  + pyenvをgit cloneする  
    `git clone git://github.com/yyuu/pyenv.git ~/.pyenv`

  + pyenv-pip-rehashというプラグインも入れておく  
    `git clone https://github.com/yyuu/pyenv-pip-rehash.git ~/.pyenv/plugins/pyenv-pip-rehash`
     
    `pip`でプラグインを更新するごとに `pyenv rehash` しなければならないがこれを入れておけば必要なくなる


## pythonに入れているプラグイン一覧 (2016.6.10)
  + `cycler Cython matplotlib numpy pip pygame pyparsing PyQt5 PySDL2`  
    `python-dateutil pytz scipy setuptools sip six wheel`


## matplotlibのインストール方法
  + インストールに`numpy`を必要とするので事前に入れておく

  + 事前に以下のパッケージをインストールする (linux)  
    `sudo apt-get install zlib1g-dev libpng12-dev libfreetype6-dev librsvg2-common`  
    必要なパッケージは zlib, libpng, freetypeの３つである (librsvg2については未確認)

  + 表示に Tkinter を用いるので Tkinter が有効になったpythonをインストールしておくこと  
    pythonをインストールする前に `python-tk` (python2用), `python3-tk` (python3用) が入っていれば  
    pythonをインストールすると自動で有効になる

  + インストール  
    `pip install matplotlib`

  + インストールが終わったら, `~/.pyenv/versions/3.5.1/lib/python3.5/site-packages/matplotlib`
    に移動し、`fc-list` と端末に打ち込んで実行する

    3.5.1 などバージョン番号は適宜読み替えること


## scipyのインストール方法
  + 事前に以下のライブラリをインストールする  
    `gfortran swig liblapack-dev`

  + インストール  
    `pip install scipy`


## pygameのインストール方法
  + 事前に以下のライブラリをインストールする  
    `libsdl-dev libsdl-image1.2-dev libsdl-ttf2.0-dev libsdl-mixer1.2-dev libsdl-gfx1.2-dev`

  + インストール (ただし,`mercurial` も使うので入ってなければこれもインストールしておくこと)  
    `pip install hg+http://bitbucket.org/pygame/pygame`


## pysdl2のインストール方法
  + 事前に以下のライブラリをインストールする  
    `libsdl2-dev libsdl2-gfx-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-net-dev libsdl2-ttf-dev build-essential`

  + インストール  
    `pip install pysdl2`
