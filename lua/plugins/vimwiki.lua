return {
  "vimwiki/vimwiki",
  branch = "dev",
  event = "VeryLazy",
  init = function()
    vim.g.maplocalleader = "\\"
    vim.g.vimwiki_map_prefix = "<localleader>w"

    -- Only treat files inside defined wiki paths as vimwiki
    -- Stop vimwiki from highjacking .md files outside of the wiki
    vim.g.vimwiki_global_ext = 0

    vim.g.vimwiki_list = {
      {
        path = "/Users/john/Documents/vimwiki/",
        syntax = "default",
      },
    }
  end,
}
