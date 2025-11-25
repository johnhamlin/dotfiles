-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

return {
  {
    "neovim/nvim-lspconfig",
    keys = {
      { "gr", false }, -- Disable the original
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        default = { "snippets", "lsp", "path", "buffer" },
      },
      -- Set priorities to rank snippets higher
      providers = {
        snippets = {
          min_keyword_length = 0,
          score_offset = 100, -- Higher score = higher priority
        },
        lsp = {
          score_offset = 0,
        },
      },
    },
  },
}
