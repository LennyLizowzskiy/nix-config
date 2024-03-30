return {
  {
    "stevearc/overseer.nvim",
    event = "VeryLazy",
    opt = {
      strategy = "toggleterm",
    },
  },
  {
    "pianocomposer321/officer.nvim",
    dependencies = "stevearc/overseer.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
