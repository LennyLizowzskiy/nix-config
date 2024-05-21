local icons = _G.shared.icons

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
    "rcarriga/nvim-notify",
    dependencies = "nvim-telescope/telescope.nvim",
    version = "*",
    event = "VimEnter",
    init = function()
      vim.notify = require("notify")
      require("telescope").load_extension("notify")
    end,
    opts = {
      render = "compact",
      stages = "fade_in_slide_out",
      timeout = 2000,
      icons = {
        ERROR = icons.error,
        WARN = icons.warn,
        INFO = icons.info,
        DEBUG = icons.hint,
        TRACE = icons.source,
      },
    },
  },
  -- {
  --   "vigoux/notifier.nvim",
  --   event = "VimEnter",
  --   opts = {
  --     components = {
  --       "nvim",
  --       -- "lsp",
  --     },
  --     notify = {
  --       clear_time = 3000,
  --     },
  --     zindex = 999,
  --   },
  -- },
  -- {
  --   "j-hui/fidget.nvim",
  --   version = "v1.*",
  --   event = "VimEnter",
  --   opts = {},
  -- },
}
