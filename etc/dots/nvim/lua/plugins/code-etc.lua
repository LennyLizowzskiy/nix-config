return {
  { -- Docs generator
    "kkoomen/vim-doge",
    event = "VeryLazy",
  },
  { -- Folds
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      "nvim-treesitter/nvim-treesitter",
    },
    event = "VimEnter",
    init = function()
      vim.o.foldcolumn = "0"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    opts = {
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
    },
  },
  { -- Formatter
    "stevearc/conform.nvim",
    event = "VeryLazy",
    opts = {
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },

      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_fix", "ruff_format" },
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptx = { "biome" },
        -- json = { "biome" },
        css = { "prettierd" },
        scss = { "prettierd" },
        less = { "prettierd" },
        html = { "prettierd" },
        graphql = { "prettierd" },
        -- yaml = { "prettierd" },
        toml = { "taplo" },
        markdown = { "markdownlint-cli2" },
        -- rust = { "rustfmt" },
        sh = { "shellcheck" },
        nix = { "nixfmt" },
      },
    },
  },
  { -- Snippets
    "L3MON4D3/LuaSnip",
    event = "VeryLazy",
    config = function()
      local luasnip = require("luasnip")
    end,
  },
  { -- Code outline
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