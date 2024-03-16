return {
  { -- code to image
    "ellisonleao/carbon-now.nvim",
    cmd = "CarbonNow",
    main = "carbon-now",
    opts = {
      options = {
        titlebar = "",
        theme = "One Dark",
        font = "Hack",
      },
    },
  },
  { -- commenter
    "echasnovski/mini.nvim",
    version = "*",
    name = "mini-comment",
    event = "VeryLazy",
    config = function()
      vim.opt.commentstring = ""

      require("mini.comment").setup()
    end,
  },
  --   { -- better quickfix window
  --
  --   },
  { -- [ & ] moves
  },
  { -- align text
    "echasnovski/mini.align",
    version = false,
    event = "VeryLazy",
  },
  { -- editorconfig support
    "gpanders/editorconfig.nvim",
    event = "VeryLazy",
    config = function()
      local cfg = require("editorconfig")
    end,
  },
  { -- move any selection in any direction
    "echasnovski/mini.move",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
  {
    "brenton-leighton/multiple-cursors.nvim",
    event = "VeryLazy",
  },
  { -- notes
    "gsuuon/note.nvim",
    cmd = {
      "Note",
      "NoteIndex",
    },
  },
  { -- per-window buffer scope
  },
  { -- search and replace
    "nvim-pack/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  { -- edit with sudo
    "lambdalisue/suda.vim",
    cmd = {
      "SudaRead",
      "SudaWrite",
    },
    config = function()
      vim.g.suda_smart_edit = 1
    end,
  },
  { -- surround actions
    "echasnovski/mini.surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
  { -- trailing space actions
    "echasnovski/mini.trailspace",
    version = "*",
    event = "VimEnter",
    opts = {},
  },
  { -- split and join blocks of code
    "Wansmer/treesj",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
  },
  { -- window picker
    "s1n7ax/nvim-window-picker",
    event = "VeryLazy",
    keys = {
      { "<leader>gw", "<cmd>lua require('window-picker').pick_window()<cr>", desc = "Go to a window" },
    },
    opts = {
      hint = "floating-big-letter",
      selection_chars = "ERTY" .. "DFG" .. "XCV" .. "UIO" .. "HJKL" .. "VBNM<>",

      filter_rules = {
        include_current_win = false,
        autoselect_one = true,

        bo = {
          filetype = { "neo-tree", "neo-tree-popup", "notify" },
          buftype = { "terminal", "quickfix" },
        },
      },
    },
  },
}
