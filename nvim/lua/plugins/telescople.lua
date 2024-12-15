return {
  'nvim-telescope/telescope.nvim',
  dependencies = {'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-fzf-native.nvim'},
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<Leader>ff', builtin.find_files, {noremap=true})
    vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {noremap=true})
    vim.keymap.set('n', '<Leader>fb', builtin.buffers, {noremap=true})

    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
      }
    }
    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    require('telescope').load_extension('fzf')
  end
}

