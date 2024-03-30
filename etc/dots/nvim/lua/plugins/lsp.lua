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
    "soulis-1256/eagle.nvim",
    init = function()
      vim.o.mousemoveevent = true
    end,
    opts = {},
  },
  {
    "artemave/workspace-diagnostics.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "aznhe21/actions-preview.nvim",
    event = "VeryLazy",
    config = function()
      require("actions-preview").setup({
        highlight_commands = {
          require("actions-preview.highlight").delta(),
        },
        telescope = {
          sorting_strategy = "ascending",
          layout_strategy = "vertical",
          layout_config = {
            width = 0.8,
            height = 0.9,
            prompt_position = "top",
            preview_cutoff = 20,
            preview_height = function(_, _, max_lines)
              return max_lines - 15
            end,
          },
        },
      })
    end,
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
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "VeryLazy",
  --   main = "lsp_signature",
  --   opts = {
  --     max_width = 60,
  --     floating_window_abow_cur_line = false,
  --     hint_prefix = "󰐾 ",
  --     hint_inline = function()
  --       return true
  --     end,
  --     handler_opts = {
  --       border = "shadow",
  --     },
  --   },
  -- },
  -- {
  --   "Wansmer/symbol-usage.nvim",
  --   optional = true,
  --   event = "BufReadPre",
  --   opts = {},
  -- },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    opts = {},
  },
  {
    "jinzhongjia/LspUI.nvim",
    branch = "main",
    event = "VeryLazy",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      "ray-x/lsp_signature.nvim",
      {
        "b0o/SchemaStore.nvim",
        opts = nil,
      },
      {
        "folke/neodev.nvim",
        event = "VeryLazy",
        opts = {},
      },
    },
    init = function()
      -- enable diagnostics in INSERT mode
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = true,
      })

      local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end,
    config = function()
      local cfg = require("lspconfig")
      cfg.lua_ls.setup({
        settings = {
          Lua = {
            hint = {
              enable = true,
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

      cfg.ols.setup({}) -- odin

      cfg.html.setup({})

      cfg.cssls.setup({})

      cfg.tailwindcss.setup({
        filetypes_exclude = { "markdown" },
      })

      cfg.biome.setup({ -- js, json, ts, tsx
        filetypes_exclude = { "json" },
      })

      -- py
      cfg.ruff_lsp.setup({})
      cfg.pyright.setup({})

      cfg.zls.setup({}) -- zig

      cfg.taplo.setup({}) -- toml

      cfg.yamlls.setup({
        capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true,
            },
          },
        },
        settings = {
          redhat = { telemetry = { enabled = false } },
          yaml = {
            keyOrdering = false,
            format = {
              enable = true,
            },
            validate = true,
            schemaStore = {
              enable = true,
              url = "",
            },
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      })

      cfg.jsonls.setup({
        settings = {
          json = {
            schemas = require("schemastore").json.schemas({
              ignore = {
                ".eslintrc",
                "package.json",
              },
            }),
            format = {
              enable = true,
            },
            validate = { enable = true },
          },
        },
      })
    end,
  },
}
