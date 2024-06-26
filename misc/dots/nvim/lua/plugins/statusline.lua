local funcs = shared.funcs

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
      local ll = require("lualine")

      ll.setup({
        options = {
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {
              "CHADTree",
              "starter",
              "TelescopePrompt",
              "dbui",
              "[dap-repl]",
            },
          },
          always_divide_middle = true,
          -- globalstatus = true,
          refresh = {
            statusline = 1000,
          },
        },
        sections = {
          lualine_a = {
            {
              "mode",
              icons_enabled = false,
              fmt = function(str)
                local new = str:sub(1, 3)
                if new == "COM" then
                  new = "CMD"
                end

                return new
              end,
            },
          },
          lualine_b = { "branch" },
          lualine_c = {
            -- local_path(),
            "filename",
          },
          lualine_x = {
            "overseer",
            "diagnostics",
            "diff",
          },
          lualine_y = {},
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {
            {
              "branch",
              cond = function()
                return (not funcs.is_dap_ui_ft(vim.bo.filetype))
              end,
            }
          },
          lualine_c = {
            {
              "filename",
              -- cond = function()
              --   return (not is_dap_ui_ft(vim.bo.filetype))
              -- end,
            },
          },
          lualine_x = {
            {
              "progress",
              cond = function()
                return (not funcs.is_dap_ui_ft(vim.bo.filetype))
              end,
            },
          },
          lualine_y = {
            {
              "location",
              cond = function()
                return (not funcs.is_dap_ui_ft(vim.bo.filetype))
              end,
            },
          },
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