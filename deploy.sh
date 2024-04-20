#!/bin/sh

### fish
FISH_CONFIG_PATH="${HOME}/.config/fish"

if [ -d ${fish_conf_path} ]; then
  # config.fish
  if [ ! -e ${FISH_CONFIG_PATH}/config.fish ]; then
    ln -s ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
    echo "make symbolic link 'fish/config.fish' at ~/.config/fish/"
  fi
  # ls_after_cd.fish
  if [ ! -e ${FISH_CONFIG_PATH}/conf.d/ls_after_cd.fish ]; then
    ln -s ~/dotfiles/fish/conf.d/ls_after_cd.fish ~/.config/fish/conf.d/ls_after_cd.fish
    echo "make symbolic link 'fish/conf.d/ls_after_cd.fish' at ~/.config/fish/conf.d/"
  fi
  # fish_prompt.fish
  if [ ! -e ${FISH_CONFIG_PATH}/functions/fish_prompt.fish ]; then
    ln -s ~/dotfiles/fish/functions/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
    echo "make symbolic link 'fish/functions/fish_prompt.fish' at ~/.config/fish/functions/"
  fi
fi

### Neovim
if [ ! -d ${HOME}/.config/nvim ]; then
  ln -s ~/dotfiles/nvim ~/.config/nvim
  echo "make symbolic link 'nvim' at ~/.config/"
fi

