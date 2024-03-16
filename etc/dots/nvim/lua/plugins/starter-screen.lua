return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    name = "mini-starter",
    event = "VimEnter",
    main = "mini.starter",
    opts = {
      header = [[                  _
                 (_)
  _ __   __   __  _   _ __ ___
 | '_ \  \ \ / / | | | '_ ` _ \
 | | | |  \ V /  | | | | | | | |
 |_| |_|   \_/   |_| |_| |_| |_|]],
      items = {
        { name = "Projects", action = "Telescope project display_type=full", section = "" },
        { name = "Files (recent)", action = "Telescope oldfiles", section = "" },
        { name = "Sessions (recent)", action = [[lua require("nvim-possession").list()]], section = "" },
        { name = " ", action = "", section = "" },
        {
          name = "Neovim configuration",
          action = "Telescope file_browser path=" .. vim.env.HOME .. "/.config/nvim/",
          section = "",
        },
      },
      footer = "",
    },
  },
}
