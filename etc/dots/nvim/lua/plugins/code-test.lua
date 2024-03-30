return {
  {
    "nvim-neotest/neotest",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/nvim-nio",

      "folke/trouble.nvim",
      "mrcjkb/rustaceanvim",
    },
    ft = {
      "rust",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("rustaceanvim.neotest"),
        },
        status = {
          enabled = true,
          virtual_text = true,
        },
        output = {
          enabled = true,
          open_on_run = true,
        },
        quickfix = {
          enabled = true,
          open = function()
            require("trouble").open({ mode = "quickfix", focus = false })
          end,
        },
      })
    end,
  },
}
