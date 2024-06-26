return {
  'tanvirtin/monokai.nvim',
  lazy = false,
  config = function()
    require('monokai').setup{ italics = false }
    vim.cmd.colorscheme 'monokai'
    vim.api.nvim_set_hl( 0, 'Normal', {ctermbg = 'none'} )
    vim.api.nvim_set_hl( 0, 'NonText', {ctermbg = 'none'} )
    vim.api.nvim_set_hl( 0, 'LineNr', {fg = '#504945', ctermbg = 'none'} )
    vim.api.nvim_set_hl( 0, 'Folded', {ctermbg = 'none'} )
    vim.api.nvim_set_hl( 0, 'EndOfBuffer', {ctermbg = 'none'} )
    vim.api.nvim_set_hl( 0, 'CursorLine', {bg = 'none'} )
    vim.api.nvim_set_hl( 0, 'CursorLineNr', {fg = '#ffad5c', bg = 'none'} )
  end
}

