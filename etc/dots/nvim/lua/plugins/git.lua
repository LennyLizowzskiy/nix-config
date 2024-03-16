return {
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    cmd = {
      "DiffviewOpen",
      "DiffViewFileHistory",
    },
    opts = {},
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",

      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {},
  },
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
