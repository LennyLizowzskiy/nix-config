return {
  {
    "miversen33/netman.nvim",
    event = "VimEnter",
    config = function()
      require("netman")
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "3.*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",

      "mrbjarksen/neo-tree-diagnostics.nvim",
      "miversen33/netman.nvim",
      "antosha417/nvim-lsp-file-operations",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    event = "VimEnter",
    keys = {
      { "<leader>fM", "<cmd>Neotree toggle dir=" .. vim.fn.getcwd() .. "<cr>", desc = "Show project's file tree'" },
      { "<leader>lsd", "<cmd>Neotree diagnostics toggle bottom<cr>", desc = "Toggle LSP diagnostics summary" },
    },
    config = function()
      require("neo-tree").setup({
        sources = {
          "filesystem",
          "buffers",
          "git_status",
          "document_symbols",

          "diagnostics", -- mrbjarksen/neo-tree-diagnostics.nvim
          "netman.ui.neo-tree", -- miversen33/netman.nvim
        },

        enable_git_status = true,
        enable_diagnostics = true,

        filesystem = {
          hijack_netrw_behavior = "open_current",
        },
      })

      require("lsp-file-operations").setup()
    end,
  },
}