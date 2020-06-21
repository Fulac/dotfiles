# --------------------------------------------
# PATH設定
# --------------------------------------------
# linuxbrew
if [ -d "/home/linuxbrew" ]; then
  export PATH="/home/linuxbrew/.linuxbrew/bin":$PATH
  export PATH="/home/linuxbrew/.linuxbrew/sbin":$PATH
  export MANPATH="/home/linuxbrew/.linuxbrew/share/man":$MANPATH
  export INFOPATH="/home/linuxbrew/.linuxbrew/share/info":$INFOPATH
  export LD_LIBRARY_PATH="/home/linuxbrew/.linuxbrew/lib":$LD_LIBRARY_PATH
  export C_INCLUDE_PATH="/home/linuxbrew/.linuxbrew/include":$C_INCLUDE_PATH
  export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share":$XDG_DATA_DIRS
fi

# texlive
if [ -d "/usr/local/texlive" ]; then
  export PATH="/usr/local/texlive/2016/bin/x86_64-linux":$PATH
  export MANPATH="/usr/local/texlive/2016/texmf-dist/doc/man":$MANPATH
  export INFOPATH="/usr/local/texlive/2016/texmf-dist/doc/info":$INFOPATH
fi


# --------------------------------------------
# Aliases
# --------------------------------------------
alias a="./a.out"
alias ls="ls --color"
alias ll="ls --color -lA"
alias la="ls --color -A"
alias lf="ls --color -F"
alias grep="grep --color"
alias fgrep="fgrep --color"
alias egrep="egrep --color"
alias javac="javac -J-Dfile.encoding=UTF-8"
alias java="java -Dfile.encoding=UTF-8"
#alias brew="env PATH=${PATH/$HOME\/.pyenv\/shims:/} brew"
