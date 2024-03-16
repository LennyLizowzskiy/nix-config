return {
  {
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
        json = { "biome" },
        css = { "prettierd" },
        scss = { "prettierd" },
        less = { "prettierd" },
        html = { "prettierd" },
        graphql = { "prettierd" },
        yaml = { "prettierd" },
        toml = { "taplo" },
        markdown = { "markdownlint-cli2" },
        -- rust = { "rustfmt" },
        sh = { "shellcheck" },
      },
    },
  },
}
