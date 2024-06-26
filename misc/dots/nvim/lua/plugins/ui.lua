local icons = shared.icons

local devicons = {
  info = {
    icon = icons.filetypes._info,
    color = "#5f5f00",
    cterm_color = "58",
  },
  git = {
    icon = icons.filetypes._git,
    color = "#d75f5f",
    cterm_color = "167",
    name = "git-related",
  },
}

return {
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  { "echasnovski/mini.cursorword", version = false, opts = {} },
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override = {
        md = {
          icon = icons.filetypes.markdown,
        },
        sh = {
          icon = icons.filetypes.sh,
        },
        lock = {
          icon = icons.filetypes.lock,
        },
        odin = {
          icon = icons.filetypes.odin,
          color = "#3982d2",
          cterm_color = "32",
          name = "odin",
        },
        txt = {
          icon = icons.filetypes.txt,
          color = "#9e9e9e",
          cterm_color = "247",
        },
        nix = {
          icon = icons.filetypes.nix,
        },
      },

      override_by_filename = {
        ["LICENSE"] = devicons.info,
        [".gitignore"] = devicons.git,
        [".gitmodules"] = devicons.git,
      },
    },
  },
  {
    "3rd/image.nvim",
    lazy = false,
    opts = {
      backend = "ueberzug",
      max_width_window_percentage = 60,
      max_height_window_percentage = 50,
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    config = function()
      require("ibl").setup({
        indent = {
          char = "▏",
        },
        whitespace = {
          remove_blankline_trail = false,
        },
        scope = {
          enabled = false,
        },
        exclude = {
          filetypes = {
            "help",
            "Trouble",
            "trouble",
            "lazy",
            "neo-tree",
          },
        },
      })
    end,
  },
  {
    "mawkler/modicator.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.termguicolors = true
      vim.o.cursorline = true
      vim.o.number = true
    end,
    config = function()
      require("modicator").setup()
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = {
      stop_eof = false,
    },
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {},
    opts = {},
  },
  {
    "lukas-reineke/virt-column.nvim",
    lazy = false,
    opts = {
      char = "│",
    },
  },
  {
    "echasnovski/mini.animate",
    version = "*",
    event = "VimEnter",
    opts = {
      scroll = {
        enable = false,
      },
      cursor = {
        enable = false,
      },
    },
  },
  {
    "uga-rosa/ccc.nvim",
    event = "VimEnter",
    opts = {},
    config = function(opts)
      local ccc = require("ccc")
      local mapping = ccc.mapping

      ccc.setup(opts)
    end,
  },
  -- {
  --   "echasnovski/mini.hipatterns",
  --   version = "*",
  --   event = "VeryLazy",
  --   opts = {
  --     highlighters = {
  --       hex_color = hipatterns.gen_highlighter.hex_color(),
  --     }
  --   },
  -- },
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   event = "VimEnter",
  --   opts = {
  --     user_default_options = {
  --       names = false,
  --       RRGGBBAA = false,
  --       css = true,
  --       css_fn = true,
  --       tailwind = true,
  --     },
  --     filetypes = {
  --       "*",
  --       css = {
  --         css = true,
  --       },
  --       html = {
  --         names = false,
  --         mode = "foreground",
  --         tailwind = true,
  --         2,
  --       },
  --       cmp_docs = {
  --         always_update = true,
  --       },
  --     },
  --   },
  -- },
}