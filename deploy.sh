#!/bin/sh

### fish
FISH_CONFIG_PATH="${HOME}/.config/fish"

if [ -d ${fish_conf_path} ]; then
  # config.fish
  ln -sf ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
  echo "make symbolic link 'fish/config.fish' at ~/.config/fish/"

  # ls_after_cd.fish
  ln -sf ~/dotfiles/fish/conf.d/ls_after_cd.fish ~/.config/fish/conf.d/ls_after_cd.fish
  echo "make symbolic link 'fish/conf.d/ls_after_cd.fish' at ~/.config/fish/conf.d/"

  # fish_prompt.fish
  ln -sf ~/dotfiles/fish/functions/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
  echo "make symbolic link 'fish/functions/fish_prompt.fish' at ~/.config/fish/functions/"
fi

### Neovim
ln -sf ~/dotfiles/nvim ~/.config/nvim
echo "make symbolic link 'nvim' at ~/.config/"

