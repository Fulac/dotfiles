# ------------------------------------------------
#  Prompt設定
# ------------------------------------------------
function global:prompt{
  $host.UI.Write( "Cyan", $host.UI.RawUI.BackgroundColor, "$env:USERNAME " );
  $host.UI.WriteLine( "Green", $host.UI.RawUI.BackgroundColor, "[" + (Get-Location).Path + "]" );
  "> " 
}


# ------------------------------------------------
#  PSReadLineを使った設定
# ------------------------------------------------
# Ctrl+dでPowerShellを終了する
Set-PSReadLineKeyHandler -Chord Ctrl+d -Function DeleteCharOrExit


# ------------------------------------------------
#  Alias設定
# ------------------------------------------------
# 単純なコマンドのエイリアス
Set-Alias clr clear

# 複雑なコマンドのエイリアス(ex. オプション付き 等)
function la() {
  ls -Hidden
}


# ------------------------------------------------
#  cd実行後に自動でls & ショートカット先へ移動
# ------------------------------------------------
# cdの後に自動でls
function cd-ls {
  param($path)

  try {
    Set-Location $path -ErrorAction Stop
    Get-ChildItem
  }
  catch {
    "$_"
  }
}

# ショートカットの情報を得る
filter Get-ShortcutProperty() {
  $sh  = new-object -comobject WScript.Shell
  return $sh.CreateShortcut($_)
}

# ショートカット先へも移動する
function Move-Location {
  param($path)

  If( !$path ) { $path = $HOME }

  If( ((Resolve-Path $path).Path).EndsWith(".lnk") ) {
    $ShortcutPath = Get-ChildItem $path | Get-ShortcutProperty

    If ($ShortcutPath.WorkingDirectory) {
      cd-ls $ShortcutPath.WorkingDirectory
    }
    else {
      cd-ls $ShortcutPath.TargetPath
    }
  }
  else {
    cd-ls $path
  }
}

# エイリアス設定
Remove-Item alias:cd
Set-Alias cd Move-Location

