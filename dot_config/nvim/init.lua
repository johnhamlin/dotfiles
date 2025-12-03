-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_create_autocmd("VimLeavePre", {
  group = vim.api.nvim_create_augroup("ConjureCleanup", { clear = true }),
  callback = function()
    -- Best-effort: tell the active Conjure client to exit its REPL.
    -- This calls :ConjureEval (exit) quietly; if conjure isn't loaded,
    -- or you're not in a conjure project, it just no-ops.
    pcall(vim.cmd, "silent! ConjureEval (exit)")
  end,
})
