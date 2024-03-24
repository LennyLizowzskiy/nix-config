return {
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  { "echasnovski/mini.cursorword", version = false, opts = {} },
  {
    "lukas-reineke/indent-blankline.nvim",
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
    dependencies = "projekt0n/github-nvim-theme",
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
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>tdl", "<cmd>TodoTelescope<cr>", desc = "Search through TODOs" },
    },
    opts = {},
  },
  {
    "lukas-reineke/virt-column.nvim",
    event = "VimEnter",
    opts = {},
  },
}
