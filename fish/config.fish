# --------------------------------------------
# General Settings
# --------------------------------------------
# Editorをvimに設定 (Alt+v or Alt+e)
set -x EDITOR vim

# encoding設定
set -x LANG ja_JP.UTF-8

# --------------------------------------------
# abbr Settings
# --------------------------------------------
abbr -a cl clear
abbr -a df df -h
abbr -a du du -h
abbr -a hists history search

# --------------------------------------------
# PATH Settings
# --------------------------------------------
set -Ux XDG_CONFIG_HOME $HOME/.config

# --------------------------------------------
# FishLine Color Settings
# --------------------------------------------
# Color for USER segments
set FLCLR_USER_BG           353b35
set FLCLR_USER_FG           ffffff

# Color for WRITE segments
set FLCLR_WRITE_BG          f3ff05
set FLCLR_WRITE_FG          000000

# Color for ROOT segments
set FLCLR_ROOT_BG_USER      2e2e2e
set FLCLR_ROOT_FG_USER      ffffff
set FLCLR_ROOT_BG_ROOT      ff5f00
set FLCLR_ROOT_FG_ROOT      ffffff

# Color for FULLPWD segments
set FLCLR_FULLPWD_BG        71eb00
set FLCLR_FULLPWD_FG        000000

# Color for CLOCK segments
set FLCLR_CLOCK_BG          ffaf5f
set FLCLR_CLOCK_FG          000000

# Color for SEPARATOR segments
set FLCLR_SEPARATOR_BG      2a5700
set FLCLR_SEPARATOR_FG      000000

# Color for GIT segment
set FLCLR_GIT_BG_CLEAN      a3fd49
set FLCLR_GIT_FG_CLEAN      000000
set FLCLR_GIT_BG_DIRTY      a87a83
set FLCLR_GIT_FG_DIRTY      000000
set FLCLR_GIT_BG_DETACHED   f2b0d3
set FLCLR_GIT_FG_DETACHED   000000

