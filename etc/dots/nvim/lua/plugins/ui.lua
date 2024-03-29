return {
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  { "echasnovski/mini.cursorword", version = false, opts = {} },
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
    keys = {
      { "<leader>tdl", "<cmd>TodoTelescope<cr>", desc = "Search through TODOs" },
    },
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
