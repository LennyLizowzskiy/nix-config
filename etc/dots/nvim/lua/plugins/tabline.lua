return {
  {
    "willothy/nvim-cokeline",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local get_hex = require("cokeline.hlgroups").get_hl_attr
      local is_picking_focus = require("cokeline.mappings").is_picking_focus
      local is_picking_close = require("cokeline.mappings").is_picking_close

      require("cokeline").setup({
        default_hl = {
          fg = function(buf)
            return buf.is_focused and get_hex("TabLineSel", "fg") or get_hex("TabLine", "fg")
          end,
          bg = function(buf)
            return buf.is_focused and get_hex("TabLineSel", "bg") or get_hex("TabLine", "bg")
          end,
        },

        components = {
          {
            text = " ",
          },
          {
            text = function(buf)
              return buf.devicon.icon
            end,
            fg = function(buf)
              return buf.devicon.color
            end,
          },
          {
            text = function(buf)
              return buf.unique_prefix
            end,
            italic = true,
          },
          {
            text = function(buf)
              return (is_picking_focus() or is_picking_close()) and buf.pick_letter or ""
            end,
            fg = get_hex("IncSearch", "fg"),
            bg = get_hex("IncSearch", "bg"),
            italic = true,
            bold = true,
          },
          {
            text = function(buf)
              local name = buf.filename
              if is_picking_focus() or is_picking_close() then
                name = name:sub(2) -- remove first char
              end
              return name
            end,
            bold = function(buf)
              return buf.is_focused
            end,
          },
          {
            text = " ",
          },
        },
        buffers = {
          focus_on_delete = "prev",
          new_buffers_position = "next",
          -- filter_visible = function(buf)
          --   return (filename ~= "nvim")
          -- end,
        },
        tabs = {
          placement = "right",
          components = {
            {
              text = function(tab)
                return " " .. tab.number .. " "
              end,
              fg = function(tab)
                return tab.is_active and get_hex("WinBar", "fg") or get_hex("TabLine", "fg")
              end,
              bg = function(tab)
                return tab.is_active and get_hex("TabLineSel", "bg") or get_hex("TabLine", "bg")
              end,
            },
          },
        },
        sidebar = {
          filetype = { "CHADTree", "NvimTree", "neo-tree" },
        },
      })
    end,
  },
  -- {
  --   "echasnovski/mini.tabline",
  --   dependencies = "nvim-tree/nvim-web-devicons",
  --   version = false,
  --   opts = {
  --     tabpage_section = "right",
  --   },
  -- },
  -- {
  --   "nanozuki/tabby.nvim",
  --   event = "VimEnter",
  --   dependencies = "nvim-tree/nvim-web-devicons",
  --   config = function()
  --     require("tabby.tabline")
  --   end,
  -- },
}
