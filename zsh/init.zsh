# --------------------------------------------
# os/localの設定を読み込む
# --------------------------------------------
if [ -f "${HOME}/.local.rc.zsh" ]; then
  source "${HOME}/.local.rc.zsh"
fi

case ${OSTYPE} in
  linux*)
    source "${HOME}/dotfiles/zsh/linux.rc.zsh"
    ;;
  darwin*)
    source "${HOME}/dotfiles/zsh/osx.rc.zsh"
    ;;
  cygwin)
    source "${HOME}/dotfiles/zsh/cygwin.rc.zsh"
    ;;
esac


# --------------------------------------------
# General Settings
# --------------------------------------------
source "${HOME}/dotfiles/zsh/general.rc.zsh"


# --------------------------------------------
# View
# --------------------------------------------
source "${HOME}/dotfiles/zsh/view.rc.zsh"


# --------------------------------------------
# Aliases
# --------------------------------------------
source "${HOME}/dotfiles/zsh/alias.rc.zsh"


# --------------------------------------------
# zplug
# --------------------------------------------
source "${HOME}/dotfiles/zsh/zplug.rc.zsh"


# --------------------------------------------
# cdコマンド実行後、ls を実行する
# --------------------------------------------
# lsのaliasを読み込みきった後に記述しないとnormalのlsが実行される
# local環境設定を読み込んだ後に記述すること
# linuxなどlsにオプションを付けているときに困る
function cd() {
  builtin cd $@ && ls;
}

