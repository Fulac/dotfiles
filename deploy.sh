#!/bin/sh

if [ $# -ge 2 ]; then
  echo "Usage: $0 -client(-c) or -server(-s) (Default: -client)"
  exit 1
fi

args=${1:-client}

### fish
FISH_CONFIG_PATH="${HOME}/.config/fish"

if [ -d ${fish_conf_path} ]; then
  # config.fish
  ln -sf ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
  echo "make symbolic link 'fish/config.fish' at ~/.config/fish/"

  # ls_after_cd.fish
  ln -sf ~/dotfiles/fish/conf.d/ls_after_cd.fish ~/.config/fish/conf.d/ls_after_cd.fish
  echo "make symbolic link 'fish/conf.d/ls_after_cd.fish' at ~/.config/fish/conf.d/"

  if [ $args = "-client" ] || [ $args = "-c" ]; then
    # fish_prompt.fish
    ln -sf ~/dotfiles/fish/functions/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
    echo "make symbolic link 'fish/functions/fish_prompt.fish' at ~/.config/fish/functions/"
  elif [ $args = "-server" ] || [ $args = "-s" ]; then 
    # fish_prompt.fish
    ln -sf ~/dotfiles/fish/functions/fish_server_prompt.fish ~/.config/fish/functions/fish_prompt.fish
    echo "make symbolic link 'fish/functions/fish_server_prompt.fish' at ~/.config/fish/functions/"
  fi
fi

### Neovim
ln -sf ~/dotfiles/nvim ~/.config/nvim
echo "make symbolic link 'nvim' at ~/.config/"

