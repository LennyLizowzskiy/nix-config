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
    "moyiz/git-dev.nvim",
    event = "VeryLazy",
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
  {
    "ldelossa/gh.nvim",
    dependencies = {
      {
        "ldelossa/litee.nvim",
        main = "litee.lib",
        opts = nil,
      },
    },
    opts = nil,
  },
  {
    "topaxi/gh-actions.nvim",
    cmd = "GhActions",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {},
  },
}
