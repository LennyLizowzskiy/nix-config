return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "VimEnter",
    config = function()
      local ll = require("lualine")

      ll.setup({
        options = {
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {
              "starter",
              "TelescopePrompt",
              "dbui",
            },
          },
          always_divide_middle = true,
          refresh = {
            statusline = 1000,
          },
        },
        sections = {
          lualine_a = {
            {
              "mode",
              fmt = function(str)
                local new = str:sub(1, 3)
                if new == "COM" then
                  new = "CMD"
                end

                return new
              end,
            },
          },
          lualine_b = { "buffers" },
          lualine_c = {},
          lualine_x = { "diagnostics", "diff" },
          lualine_y = {
            {
              require("nvim-possession").status,
              cond = function()
                return require("nvim-possession").status() ~= nil
              end,
            },
            "branch",
            "filetype",
          },
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = { "branch" },
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {
          "fzf",
          "lazy",
          "neo-tree",
          "overseer",
          "quickfix",
          "toggleterm",
        },
      })

      ll.hide({
        place = { "tabline", "winbar" },
        unhide = false,
      })
    end,
  },
}