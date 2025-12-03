return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          -- Remap because of mini.operators conflict
          { "gr", false },
          {
            "<leader>r",
            function()
              Snacks.picker.lsp_references()
            end,
            nowait = true,
            desc = "References",
          },
        },
      },
    },
  },
}
