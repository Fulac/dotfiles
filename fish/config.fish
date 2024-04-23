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
# XDG_CONFIG_HOME
set -Ux XDG_CONFIG_HOME $HOME/.config

# Deno
set -x DENO_INSTALL $HOME/.deno
set -x PATH $DENO_INSTALL/bin $PATH

# --------------------------------------------
# CommandLine Color Settings
# --------------------------------------------
# set color
set -U fish_color_normal normal
set -U fish_color_autosuggestion afafaf
set -U fish_color_cancel --reverse
set -U fish_color_command 00ff00
set -U fish_color_comment ff8700
set -U fish_color_cwd 98c379
set -U fish_color_cwd_root e06c75
set -U fish_color_end ff87d7
set -U fish_color_error 585858
set -U fish_color_escape 00a6b2
set -U fish_color_history_current --bold
set -U fish_color_host normal
set -U fish_color_host_remote normal
set -U fish_color_keyword
set -U fish_color_match --background=brblue
set -U fish_color_normal normal
set -U fish_color_operator ff6e33
set -U fish_color_option
set -U fish_color_param 87afff
set -U fish_color_quote ffff00
set -U fish_color_redirection b2b2b2
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_status red
set -U fish_color_user brgreen
set -U fish_color_valid_path --underline

# --------------------------------------------
# FishLine Color Settings
# --------------------------------------------
# Color for USER segments
set FLCLR_USER_BG           353b35
set FLCLR_USER_FG           ffffff

# Color for USER segments
set FLCLR_USERHOST_BG       353b35
set FLCLR_USERHOST_FG       ffffff

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

