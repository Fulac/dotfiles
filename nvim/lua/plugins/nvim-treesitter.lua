return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  -- event 指定で、Neovimが完全に起動してパスが通った後に読み込ませる
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  config = function()
    -- pcall で保護し、失敗時にメッセージを出す
    local status, configs = pcall(require, "nvim-treesitter.configs")
    if not status then
      return
    end

    configs.setup({
      ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "python", "javascript", "html", "json", "yaml" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
