return {
  {
    "altermo/ultimate-autopair.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6", --recommended as each new version will have breaking changes
    opts = {},
  },
  {
    "max397574/better-escape.nvim",
    event = "VeryLazy",
    opts = {},
  },
  { -- extended a & i text objects
    "echasnovski/mini.ai",
    version = false,
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.bracketed",
    version = false,
    event = "VeryLazy",
    opts = {},
  },
  -- {
  --   "kevinhwang91/nvim-bqf",
  --   version = "1.*",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   lazy = false,
  --   -- cmd = {
  --   --   "BqfEnable",
  --   --   "BqfDisable",
  --   --   "BqfToggle",
  --   --   "BqfAutoToggle",
  --   -- },
  -- },
  {
    "tiagovla/scope.nvim",
    event = "VimEnter",
    opts = {},
  },
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = {
      stop_eof = false,
    },
  },
  {
    "gbprod/yanky.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension("yank_history")
    end,
    opts = {},
  },
  -- {
  --   "tenxsoydev/karen-yank.nvim",
  --   opts = {},
  -- },
  -- {
  --   "mg979/vim-visual-multi",
  --   event = "VeryLazy",
  -- },
  {
    "ariel-frischer/bmessages.nvim",
    cmd = {
      "Bmessages",
      "Bmessagesvs",
      "Bmessagessp",
      "BmessagesEdit",
    },
    opts = {},
  },
  {
    "echasnovski/mini.move",
    version = "*",
    event = "BufEnter",
    opts = {},
  },
  {
    "echasnovski/mini.bufremove",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
}
