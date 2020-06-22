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


