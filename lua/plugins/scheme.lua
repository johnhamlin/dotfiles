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
    ft = { "scheme", "racket", "lisp", "clojure" },
    config = function()
      local rainbow = require("rainbow-delimiters")
      require("rainbow-delimiters.setup").setup({
        query = {
          ["scheme"] = "rainbow-delimiters",
          ["racket"] = "rainbow-delimiters",
        },
      })
    end,
  },

  -- REPL integration via Conjure
  {
    "Olical/conjure",
    ft = { "scheme", "racket" },
    init = function()
      vim.g["conjure#client#scheme#stdio#command"] = "chez"
      vim.g["conjure#client#scheme#stdio#prompt_pattern"] = "> $?"
    end,
  },

  -- Autopairs: disable ' pairing in lisps only
  {
    "windwp/nvim-autopairs",
    -- extend LazyVim's existing config
    config = function(_, opts)
      local npairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")
      local cond = require("nvim-autopairs.conds")

      -- keep LazyVim defaults
      npairs.setup(opts)

      -- remove the built-in single-quote rule
      pcall(function()
        npairs.remove_rule("'")
      end)

      -- re-add a single-quote rule, but NOT for lispy filetypes
      npairs.add_rules({
        Rule("'", "'"):with_pair(cond.not_filetypes({ "scheme", "racket", "lisp", "clojure" })),
      })
    end,
  },
}
