## Java JDKのインストール
  + 以下からJava JDKをダウンロードする.  
    http://www.oracle.com/technetwork/java/javase/downloads/index.html  
    ダウンロードするものは Linux 64bit用 のJDKでファイル名が 'tar.gz' となっているものである.  
    ダウンロードする際, ライセンスに同意することを忘れない.

  + ダウンロードしたJDKを展開する.  
    `cd ~/Downloads && tar xzvf jdk-8u92-linux-x64.tar.gz`  
    展開すると, jdk1.8.0_92 というディレクトリが生成される.  
    '8u92', '1.8.0_92' の部分はversionを示しているので適宜読み替えること. (以下も同様)

  + jdk1.8.0_92 を /usr/lobal/java/ に設置する.  
    まず, /usr/local/ に java という名前のディレクトリを作成し, その中に jdk1.8.0_92 を移動する.  
    `sudo mkdir -p /usr/local/java`  
    `sudo mv ~/Downloads/jdk1.8.0_92 /usr/local/java`

  + 最後にPATHを設定する.  
    ~/.zshrc に以下を記述する. (bash を使用している場合は ~/.bashrc に記述. ファイルがない場合は新しく作る)  
    ```
    # Java PATH
    if [ -d "/usr/local/java" ]; then
      export JAVA_HOME="/usr/local/java/jdk1.8.0_92"
      export PATH="${JAVA_HOME}/bin":$PATH
    fi
    ```  
    PATH設定は失敗するとやっかいなので, 保存する前にきちんと確認すること. 特に, 4行目の最後 :$PATH を忘れない.  
    保存したら, `source ~/.zshrc` (もしくは, `source ~/.bashrc`) を実行する.


## eclipse(Neon) のインストール ~Linuxの場合~
  + eclipse(Neon)のインストールにはjava8が必要である. そのため, まだインストールされていない場合は先にインストールしておく.  
    Neon以前のversionの場合は必要ないと思われる. (未確認)

  + eclipseを以下からダウンロードする. 64bit版をダウンロードする.  
      https://eclipse.org

  + tar コマンドを使ってダウンロードしたeclipseを展開する.  
      `cd ~/Downloads && tar xzvf eclipse-inst-linux64.tar.gz`

  + 展開するとeclipse-installerというディレクトリが生成される.  
    生成されたディレクトリの中に移動すると, eclipse-instという実行ファイルがあるのでこれを実行する.  
      `cd ~/Downloads/eclipse-installer && ./eclipse-inst`

  + 実行するとインストールウィザードが起動するので, それに沿ってインストールを行う.  
    インストール先を変更しなければ, ホームディレクトリの直下にeclipseというディレクトリが作られ, その中にeclipseが入る.  
    デフォルトのインストール場所  
      `/home/<ユーザー名>/eclipse`

  + 以上でインストールは終了である. 以下は補足である. 簡単に起動できるようにするために, どちらかを行っておくことを推奨.

  + terminalからコマンドでeclipseを起動できるようにするために, eclipseに対してシンボリックリンクを作成する.  
    リンクの置き場所は/usr/lobal/binとする. 作成には以下のコマンドを実行する.  
      `sudo ln -s ${HOME}/eclipse/jee-neon/eclipse/eclipse /usr/local/bin`  
    デフォルト以外の場所にインストールした場合はlnコマンドの最初の引数のpathを適宜変更すること.  

  + Mintのメニューにeclipseを登録する.  
    まず, メニューを右クリックし、次に設定をクリックする. 設定ウィンドウが表示されるので, その中の"メニューを編集する"というボタンを押す. 
    このウィンドウでメニューへeclipseの追加を行う. ウィンドウ左のカテゴリからeclipseを登録したい場所を選ぶ (プログラミングが適していると思われる). 
    選んだら, 右の新しいアイテムと書かれたボタンを押す. あとは, 表示されたウィンドウのNameにeclipseと記入し, Commandの右のBrowseボタンから
    eclipseの実行ファイルを選んでOKする. 最後にもう一度OKボタンを押せば登録される.


## eclipseの日本語化
  + 日本語化のため, 日本語化用プラグインPleiadesをダウンロードする.  
    eclipseとセットになったAll in OneはWindows用なので, その下のプラグイン・ダウンロードから最新版, または安定版の
    どちらか好きな方をダウンロードする. ダウンロードするものはファイル名に'src'がついていない方で良いと思われる.  
    http://mergedoc.osdn.jp/

  + ダウンロードしたzipファイルを展開する.  
      `cd ~/Downloads && unzip pleiades_1.7.0.zip -d pleiades`  
    pleiadesのversionは適宜読み替える.  上のコマンドを実行するとpleiadesというディレクトリが作られ, その中にzipファイルの中身が展開される.  

  + pleiadesディレクトリの中のファイル, およびディレクトリをeclipseの実行ファイルが存在するディレクトリにコピーする. (readmeはいらない)  
    コピーしたときにディレクトリをマージしていいかどうか聞かれた場合は 'はい' を選択する.  

  + 最後に, eclipseの実行ファイルが存在する場所にeclipse.iniというファイルがあるので, これをエディタで開く.  
    開いたら, ファイルの一番最後の行に以下を追加する  
      `-javaagent:/home/<ユーザー名>/eclipse/jee-neon/eclipse/plugins/jp.sourceforge.mergedoc.pleiades/pleiades.jar`  
    <ユーザー名>には自分が使っているユーザー名を入れる.  また, eclipseのインストール先を変更している場合はpathを適宜変更する.  

  + 以上で日本語化は終了である.  
