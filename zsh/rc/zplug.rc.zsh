# --------------------------------------------
# zplug
# --------------------------------------------
# Check if zplug is installed
if [[ ! -d $HOME/.zplug ]]; then
  git clone https://github.com/zplug/zplug $HOME/.zplug
  source $HOME/.zplug/init.zsh && zplug update --self
fi

# Essential
source $HOME/.zplug/init.zsh

# plugins
# after executing compinit command and sourcing other plugins
zplug "zsh-users/zsh-syntax-highlighting", defer:1

# Install plugins that have not been installed yet
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load


# --------------------------------------------
# zsh-syntax-highlighting
# --------------------------------------------
# change style
ZSH_HIGHLIGHT_STYLES[globbing]='fg=magenta'
