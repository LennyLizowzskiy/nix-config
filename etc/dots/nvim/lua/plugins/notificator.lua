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
  {
    "vigoux/notifier.nvim",
    event = "VimEnter",
    opts = {
      components = {
        "nvim",
      },
    },
  },
}