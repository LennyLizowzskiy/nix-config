return {
  --[[{
    "echasnovski/mini.notify",
    version = "*",
    event = "VimEnter",
    opts = {
      lsp_progress = {
        enable = false,
      },
    },
  },]]
  --[[{
    "rcarriga/nvim-notify",
    version = "*",
    event = "VimEnter",
    opts = {},
  },]]
  {
    "vigoux/notifier.nvim",
    event = "VimEnter",
    opts = {
      components = {
        "nvim",
        "lsp",
      },
    },
  },
}
