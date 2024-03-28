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
        -- "lsp",
      },
      notify = {
        clear_time = 3000,
      },
      zindex = 999,
    },
  },
  {
    "j-hui/fidget.nvim",
    version = "v1.*",
    event = "VimEnter",
    opts = {},
  },
}
