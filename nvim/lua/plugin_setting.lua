---------------------------------------------
-- ddc.vim
---------------------------------------------
vim.fn['ddc#custom#patch_global']( 'ui', 'pum' )
vim.fn['ddc#custom#patch_global']( 'sources', {'around', 'buffer', 'nvim-lua', 'lsp'} )
vim.fn['ddc#custom#patch_global']( 'sourceOptions', {
  _ = {
    matchers = {'matcher_fuzzy'},
    sorters = {'sorter_fuzzy'},
    converters = {'converter_fuzzy'},
  },
  buffer = {
    mark = {'[B]'},
  },
  nvimlua = {
    mark = {'[Lua]'},
    forceCompletionPattern = {'\\.'},
  },
  lsp = {
    mark = 'lsp',
    forceCompletionPattern = {'\\.\\w*|:\\w*|->\\w*'}
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

