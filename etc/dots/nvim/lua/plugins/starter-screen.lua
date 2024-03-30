return {
  {
    "echasnovski/mini.starter",
    version = "*",
    lazy = false,
    opts = {
      header = [[
                  _
                 (_)
  _ __   __   __  _   _ __ ___
 | '_ \  \ \ / / | | | '_ ` _ \
 | | | |  \ V /  | | | | | | | |
 |_| |_|   \_/   |_| |_| |_| |_|]],
      items = {
        { name = "Projects", action = "Telescope whaler", section = "" },

        { name = "Files (recent)", action = "Telescope oldfiles", section = "" },

        { name = "Sessions (recent)", action = "Telescope session-lens", section = "" },

        { name = "Definitions", action = "Telescope lazy_plugins", section = "Plugins" },
        { name = "Manage", action = "Lazy", section = "Plugins" },


        -- { name = "Projects", action = "Telescope project display_type=full", section = "" },
        -- { name = "Files (recent)", action = "Telescope oldfiles", section = "" },
        -- { name = "Sessions (recent)", action = "Telescope session-lens", section = "" },
        -- -- { name = " ", action = "", section = "" },
        -- {
        --   name = "Plugin manager",
        --   action = "Lazy",
        --   section = "󰣖 Util"
        -- },
        -- {
        --   name = "Neovim configuration",
        --   action = "Neotree dir=" .. vim.env.HOME .. "/.config/nvim/",
        --   section = "󰣖 Util",
        -- },
      },
      footer = "current time is.. " .. os.date("%Y-%m-%d %H:%M"),
    },
  },
}
