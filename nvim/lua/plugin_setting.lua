---------------------------------------------
-- ddc.vim
---------------------------------------------
vim.fn['ddc#custom#patch_global']( 'ui', 'pum' )
vim.fn['ddc#custom#patch_global']( 'sources', {'around', 'buffer', 'nvim-lua'} )
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
})
vim.fn['ddc#custom#patch_global']( 'sourceParams', {
  buffer = {
    requireSameFiletype = {'v:false'},
    limitBytes = {5000000},
    fromAltBuf = {'v:true'},
    forceCollect = {'v:true'},
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

