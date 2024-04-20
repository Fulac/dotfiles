return{
  'nvim-tree/nvim-tree.lua',
  lazy = false,

  config = function()
    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true
    
    -- OR setup with some options
    require('nvim-tree').setup({
      sort = {
        sorter = 'case_sensitive',
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    })
    -- nvim起動時にFileツリーも表示する
    --require('nvim-tree.api').tree.toggle(false, true)
    vim.keymap.set('n', '<C-i>', ':NvimTreeToggle<cr>', {silent = true, noremap = true})
  end
}

