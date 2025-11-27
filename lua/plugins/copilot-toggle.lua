return {
  "zbirenbaum/copilot.lua",
  keys = {
    {
      "<leader>at", -- pick whatever you like
      function()
        local client = require("copilot.client")
        local cmd = require("copilot.command")

        if client.is_disabled() then
          cmd.enable()
        else
          cmd.disable()
        end
      end,
      desc = "Toggle Copilot",
    },
  },
}
