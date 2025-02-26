---------------------------------------------
-- colorsheme settings
---------------------------------------------
vim.cmd.colorscheme 'tender'
vim.api.nvim_set_hl( 0, 'Normal', {ctermbg = 'none'} )
vim.api.nvim_set_hl( 0, 'NonText', {ctermbg = 'none'} )
vim.api.nvim_set_hl( 0, 'LineNr', {fg = '#504945', ctermbg = 'none'} )
vim.api.nvim_set_hl( 0, 'Folded', {ctermbg = 'none'} )
vim.api.nvim_set_hl( 0, 'EndOfBuffer', {ctermbg = 'none'} )
vim.api.nvim_set_hl( 0, 'CursorLine', {bg = 'none'} )
vim.api.nvim_set_hl( 0, 'CursorLineNr', {fg = '#ffad5c', bg = 'none'} )

---------------------------------------------
-- ddc.vim
---------------------------------------------
vim.fn['ddc#custom#patch_global']( 'ui', 'pum' )
vim.fn['ddc#custom#patch_global']( 'sources', {'around', 'file', 'lsp', 'buffer', 'nvim-lua'} )

vim.fn['ddc#custom#patch_global']( 'sourceOptions', {
  _ = {
    matchers = {'matcher_fuzzy'},
    sorters = {'sorter_fuzzy'},
    converters = {'converter_fuzzy'},
  },
  buffer = {
    mark = '[B]',
  },
  nvimlua = {
    mark = '[Lua]',
    forceCompletionPattern = {'\\.'},
  },
  lsp = {
    mark = '[LSP]',
    forceCompletionPattern = {'\\.\\w*|:\\w*|->\\w*'},
  },
  file = {
    mark = '[F]',
    isVolatile = {'v:true'},
    forceCompletionPattern = {'\\S/\\S*'},
  },
})

vim.fn['ddc#custom#patch_global']( 'sourceParams', {
  buffer = {
    requireSameFiletype = {'v:false'},
    limitBytes = {5000000},
    fromAltBuf = {'v:true'},
    forceCollect = {'v:true'},
  },
  lsp = {
    snippetEngine = vim.fn['denops#callback#register'](function(body)
      vim.fn['vsnip#anonymous'](body)
    end),
    enableResolveItem = true,
    enableAdditionalTextEdit = true,
  },
  file = {
    mode = {'win32'},
  }
})

vim.fn['ddc#enable']()

--keymap
vim.keymap.set( 'i', '<TAB>', function()
  return vim.fn['pum#visible']() and
    '<Cmd>call pum#map#insert_relative(+1)<CR>' or '<TAB>'
end, {expr = true}
)
vim.keymap.set( 'i', '<S-TAB>', '<Cmd>call pum#map#insert_relative(-1)<CR>' )
vim.keymap.set( 'i', '<C-y>', '<Cmd>call pum#map#confirm()' )
vim.keymap.set( 'i', '<C-e>', '<Cmd>call pum#map#cancel()' )
vim.keymap.set( 'i', '<PageDown>', '<Cmd>call pum#map#insert_relative(+1)<CR>' )
vim.keymap.set( 'i', '<PageUp>', '<Cmd>call pum#map#insert_relative(-1)<CR>' )

