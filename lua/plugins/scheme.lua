return {
  -- Ensure scheme support
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed or {}, { "scheme" })
    end,
  },

  -- Rainbow brackets ONLY for Scheme/Racket
  {
    "HiPhish/rainbow-delimiters.nvim",
    ft = { "scheme", "racket", "lisp", "clojure" }, -- lazy-load only for these
    config = function()
      local rainbow = require("rainbow-delimiters")
      require("rainbow-delimiters.setup").setup({
        query = {
          ['scheme'] = 'rainbow-delimiters',
          ['racket'] = 'rainbow-delimiters',
        },
      })
    end,
  },

  -- REPL integration
  {
    "Olical/conjure",
    ft = { "scheme", "racket" },
  },
}
