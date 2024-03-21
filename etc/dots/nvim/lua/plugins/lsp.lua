return {
  { -- list for showing diagnostics, references, telescope results, quickfix and location lists
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    opts = {},
  },
  {
    "smjonas/inc-rename.nvim",
    dependencies = {
      "stevearc/dressing.nvim",
    },
    cmd = {
      "IncRename",
    },
    config = function()
      require("inc_rename").setup({
        input_buffer_style = "dressing",
      })
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    main = "lsp_signature",
    opts = {
      max_width = 60,
      floating_window_abow_cur_line = false,
      hint_prefix = "󰐾 ",
    },
  },
  {
    "Wansmer/symbol-usage.nvim",
    optional = true,
    event = "BufReadPre",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    init = function()
      -- enable diagnostics in INSERT mode
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = true,
      })

      -- local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
      -- for type, icon in pairs(signs) do
      --   local hl = "DiagnosticSign" .. type
      --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      -- end
    end,
    config = function()
      local cfg = require("lspconfig")
      cfg.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = {
                "vim",
                "require",
              },
            },
            workspace = {
              library = {
                vim.api.nvim_get_runtime_file("", true),
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
              },
              maxPreload = 10000,
              preloadFileSize = 1000,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      cfg.nixd.setup({})

      cfg.marksman.setup({}) -- md

      cfg.typst_lsp.setup({})

      cfg.ols.setup({})

      cfg.html.setup({})

      cfg.cssls.setup({})

      cfg.tailwindcss.setup({})

      cfg.biome.setup({}) -- js, json, ts, tsx

      cfg.ruff_lsp.setup({}) -- py

      cfg.zls.setup({}) -- zig

      cfg.taplo.setup({}) -- toml
    end,
  },
}
