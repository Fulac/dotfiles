## Font設定
  + Terminalのfont設定にインストールしたはずのフォントが一覧に表示されないときは次のコマンドを実行する  
  `gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string "Ricty gDiminished for Powerline 13"`  
    ""の中に設定したいフォント名と大きさを記述する
