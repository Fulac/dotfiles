return{
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local config = require('nvim-treesitter.configs')

    config.setup({
      ensure_installed = {'c', 'cpp', 'lua', 'vim', 'vimdoc', 'python', 'robot', 'ssh_config','javascript', 'html', 'json', 'yaml', 'tcl'},
      highlight = {enable = true},
      indent = {enable = true},
    })
  end
}

