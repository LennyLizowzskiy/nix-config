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
  -- {
  --   "ThePrimeagen/harpoon",
  --   branch = "harpoon2",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",

  --     "nvim-telescope/telescope.nvim",
  --   },
  --   event = "VeryLazy",
  --   config = function()
  --     local hp = require("harpoon")
  --     hp:setup()
  --   end,
  -- },
  { -- commenter
    "echasnovski/mini.comment",
    version = false,
    event = "VeryLazy",
    opts = {},
  },
  { -- align text
    "echasnovski/mini.align",
    version = false,
    event = "VeryLazy",
    opts = {},
  },
  { -- editorconfig support
    "gpanders/editorconfig.nvim",
    event = "VeryLazy",
    config = function()
      -- local cfg = require("editorconfig")
    end,
  },
  { -- move any selection in any direction
    "echasnovski/mini.move",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
  -- {
  --   "brenton-leighton/multiple-cursors.nvim",
  --   event = "VeryLazy",
  -- },
  { -- notes
    "gsuuon/note.nvim",
    cmd = {
      "Note",
      "NoteIndex",
    },
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
    keys = {
      -- { "<leader>fs", [[<cmd>lua require'mini.trailspace'.trim()<cr>]], desc = "Trim all trailing whitespace" }, -- format space
    },
    init = function()
      local augroup = vim.api.nvim_create_augroup("TrimTrailingWhitespace", {})

      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        pattern = "*",
        callback = function()
          require("mini.trailspace").trim()
        end,
      })
    end,
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
  -- {
  --   "vhyrro/luarocks.nvim",
  --   priority = 1000,
  --   event = "VeryLazy",
  --   config = true,
  -- },
  {
    "sontungexpt/url-open",
    event = "VeryLazy",
    cmd = "URLOpenUnderCursor",
    config = function()
      local status_ok, url_open = pcall(require, "url-open")
      if not status_ok then
        return
      end
      url_open.setup({})
    end,
  },
  {
    "chrisgrieser/nvim-alt-substitute",
    event = "CmdlineEnter",
    opts = true,
  },
  -- {
  --   "LintaoAmons/cd-project.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     project_picker = "telescope",
  --   },
  -- }
  {
    "echasnovski/mini.visits",
    event = "VeryLazy",
    version = "*",
    opts = {},
  },
  {
    "ziontee113/icon-picker.nvim",
    event = "VeryLazy",
    opts = {},
  },
}