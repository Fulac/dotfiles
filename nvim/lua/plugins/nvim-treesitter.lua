return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = { 
      'c', 'cpp', 'lua', 'vim', 'vimdoc', 'python', 
      'robot', 'ssh_config', 'javascript', 'html', 
      'json', 'yaml', 'tcl', 'query' 
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
  event = { "BufReadPost", "BufNewFile" },
}
