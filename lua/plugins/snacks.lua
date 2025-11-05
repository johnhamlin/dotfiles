return {
  -- This name matches the plugin from the LazyVim "extra"
  "snacks.nvim",

  -- The `opts` function will receive the default options,
  -- including the `opts.dashboard.preset.keys` table.
  opts = function(_, opts)
    -- 1. Define your new VimWiki button
    --    This format matches the items in your spec.
    local vimwiki_button = {
      icon = " ", -- Nerd Font icon (fa-book)
      key = "w",
      desc = "VimWiki",
      action = ":VimwikiIndex", -- Command to open your wiki
    }

    -- 2. Insert the button into the correct table
    --    This is the key: we are targeting `opts.dashboard.preset.keys`
    table.insert(opts.dashboard.preset.keys, 3, vimwiki_button)

    -- 3. Return the modified options table
    return opts
  end,
}
