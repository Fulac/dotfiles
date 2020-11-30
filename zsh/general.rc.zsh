# --------------------------------------------
# General Settings
# --------------------------------------------
# エディタをvimに設定
export EDITOR=vim

# 文字コードをUTF-8に設定
export LANG=ja_JP.UTF-8

# KCODEにUTF-8を設定
export KCODE=u

# autotestでfeatureを動かす
export AUTOFEATURE=tr

# terminalを256色対応にする
export TERM='xterm-256color'

# キーバインドをemacsモードに設定
bindkey -e

# キーバインドをviモードに設定
#bindkey -v

# ビープ音を鳴らさないようにする
#setopt no_beep

# ディレクトリ名の入力のみで移動する
setopt auto_cd

# コマンドのスペルを訂正する
setopt correct

# =以降も補完する(--prefix=/usrなど)
setopt magic_equal_subst

# プロンプト定義内で変数置換やコマンド置換を扱う
setopt prompt_subst

# バックグラウンドジョブの状態変化を即時報告する
setopt notify

# =commandを'which command'と同じ処理にする
setopt equals


# --------------------------------------------
# PATH設定
# --------------------------------------------
# ${HOME}/localが存在する場合
if [ -d "${HOME}/local" ]; then
  export PATH="${HOME}/local/bin":$PATH
fi

# pyenvを使用する場合
if [ -d "${HOME}/.pyenv" ]; then
 export PYENV_ROOT="${HOME}/.pyenv"
 export PATH="${PYENV_ROOT}/bin":$PATH
 eval "$(pyenv init -)"
fi

export XDG_CONFIG_HOME="${HOME}/.config"


# --------------------------------------------
# History
# --------------------------------------------
# ヒストリを保存するファイル
HISTFILE=~/.zsh_history

# メモリに保存されるヒストリの件数
HISTSIZE=50000

# 保存されるヒストリの件数
SAVEHIST=50000

# ヒストリに実行時間も保存する
setopt extended_history

# 直前と同じコマンドはヒストリに追加しない
setopt hist_ignore_dups

# 他のシェルのヒストリをリアルタイムで共有する
setopt share_history

# 余分なスペースを削除してヒストリに保存する
setopt hist_reduce_blanks

# 重複して保存しない
setopt hist_ignore_all_dups

# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# すべてのヒストリを表示する
function history-all { history -E 1 }


# --------------------------------------------
# tetris
# --------------------------------------------
#autoload -U tetris
#zle -N tetris
#bindkey '^T' tetris

