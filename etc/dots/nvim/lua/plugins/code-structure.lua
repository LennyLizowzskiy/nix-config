return {
  { -- code outline window
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    opts = {
      guides = {
        mid_item = "├╴  ",
        last_item = "╰╴  ",
        nested_top = "│  ",
        whitespace = "   ",
      },
    },
  },
}
