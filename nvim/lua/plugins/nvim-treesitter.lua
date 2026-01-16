return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  -- 起動時に読み込むためのイベント
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = { 
      'c', 'cpp', 'lua', 'vim', 'vimdoc', 'python', 
      'robot', 'ssh_config', 'javascript', 'html', 
      'json', 'yaml', 'tcl', 'query'
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}
