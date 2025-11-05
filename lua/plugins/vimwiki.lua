return {
  "vimwiki/vimwiki",
  branch = "dev",
  event = "VeryLazy",
  init = function()
    vim.g.maplocalleader = "\\"

    vim.g.vimwiki_map_prefix = "<localleader>w"

    vim.g.vimwiki_list = {
      {
        path = "/Users/john/Documents/vimwiki/",
        syntax = "default",
      },
    }
  end,
}
