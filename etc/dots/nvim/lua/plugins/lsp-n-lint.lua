local icons = shared.icons

return {
  { -- list for showing diagnostics, references, telescope results, quickfix and location lists
    "folke/trouble.nvim",
    branch = "dev",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    opts = {},
  },
  { -- lsp info on mouse hover
    "soulis-1256/eagle.nvim",
    init = function()
      vim.o.mousemoveevent = true
    end,
    opts = {},
  },
  {
    "artemave/workspace-diagnostics.nvim",
    event = "LspAttach",
    opts = {},
  },
  {
    "aznhe21/actions-preview.nvim",
    event = "LspAttach",
    config = function()
      require("actions-preview").setup({
        highlight_commands = {
          require("actions-preview.highlight").delta(),
        },
        telescope = {
          sorting_strategy = "ascending",
          layout_strategy = "vertical",
          layout_config = {
            width = 0.4,
            height = 0.6,
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
  --   "Wansmer/symbol-usage.nvim",
  --   optional = true,
  --   event = "BufReadPre",
  --   opts = {},
  -- },
  {
    "luckasRanarison/clear-action.nvim",
    opts = {
      signs = {
        icons = {
          quickfix = icons.quickfix .. " ",
          refactor = icons.refactor .. " ",
          source = icons.source .. " ",
          combined = icons._fallback .. " "
        },
        update_on_insert = true,
        show_count = false,
      },
      mappings = {
        code_action = "<leader>aq"
      },
    }
  },
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
    },
    event = "LspAttach",
    opts = {
      -- symbol_in_winbar = {
      --   show_file = false,
      -- },
      lightbulb = {
        enable = false,
        sign = icons.hint,
      },
      rename = {
        auto_save = true,
      },
      definition = {
        keys = {

        },
      },
    },
  },
  -- {
  --   "jinzhongjia/LspUI.nvim",
  --   branch = "main",
  --   event = "VeryLazy",
  --   config = function()
  --     local lui = require("LspUI")
  --     lui.setup({
  --       rename = {
  --         enable = false,
  --       },
  --       lightbulb = {
  --         enable = false,
  --       },
  --       code_action = {
  --         enable = false,
  --       },
  --       diagnostic = {
  --         enable = false,
  --       },
  --       hover = {
  --         enable = false,
  --       },
  --       inlay_hint = {
  --         enable = false,
  --       },
  --       definition = {
  --         enable = false,
  --       },
  --       type_definition = {
  --         enable = false,
  --       },
  --       declaration = {
  --         enable = false,
  --       },
  --       implementation = {
  --         enable = false,
  --       },
  --       reference = {
  --         enable = false,
  --       },
  --       pos_keybind = {
  --         enable = false,
  --       },
  --       signature = {
  --         enable = true,
  --         icon = "",
  --       },
  --     })
  --   end,
  -- },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   dependencies = "nvim-lua/plenary.nvim",
  --   config = function()
  --     local nls = require("null-ls")
  --     local b = nls.builtins
  --     nls.setup({
  --       sources = {

  --       },
  --     })
  --   end,
  -- },
  {
    "nvimtools/none-ls.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    event = "VeryLazy",
    config = function()
      local nls = require("null-ls")

      nls.setup({
        sources = {
          nls.builtins.diagnostics.buf,
          nls.builtins.diagnostics.editorconfig_checker,
          nls.builtins.diagnostics.ktlint,
          nls.builtins.diagnostics.rpmspec,
        },
      })
    end,
  },
  {
    "nvimdev/guard.nvim",
    dependencies = {
      "LennyLizowzskiy/guard-collection",
      branch = "clippy_lint"
    },
    event = "VeryLazy",
    config = function()
      local ft = require("guard.filetype")

      ft("rust")
        :lint("clippy-driver")

      require("guard").setup({
        fmt_on_save = false,
      })
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    opts = {
      floating_window = true,
      hint_enable = true,
      hint_prefix = " ",
      hint_inline = function() return true end,
      select_signature_key = "<C-n>",
    },
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      {
        "b0o/SchemaStore.nvim",
        opts = nil,
      },
      "folke/neodev.nvim",
    },
    init = function()
      -- enable diagnostics in INSERT mode
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = true,
      })

      local signs = {
        Error = icons.error,
        Warn = icons.warn,
        Hint = icons.hint,
        Info = icons.info
      }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon .. " ", texthl = hl, numhl = hl })
      end
    end,
    config = function()
      local on_attach = function(client, bufnr)
        if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable(bufnr, true)
        end
      end

      local make_defaults = function()
        return {
          on_attach = on_attach,
        }
      end

      local cfg = require("lspconfig")
      cfg.lua_ls.setup({
        settings = {
          Lua = {
            -- hint = {
            --   enable = true,
            -- },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      cfg.nixd.setup(make_defaults())

      cfg.marksman.setup(make_defaults()) -- md

      cfg.typst_lsp.setup(make_defaults())

      cfg.ols.setup(make_defaults()) -- odin

      cfg.html.setup(make_defaults())

      cfg.cssls.setup(make_defaults())

      cfg.tailwindcss.setup({
        on_attach = on_attach,
        filetypes_exclude = { "markdown" },
      })

      cfg.biome.setup({ -- js, json, ts, tsx
        on_attach = on_attach,
        filetypes_exclude = { "json" },
      })

      -- py
      cfg.ruff_lsp.setup(make_defaults())
      cfg.pyright.setup(make_defaults())

      cfg.zls.setup(make_defaults()) -- zig

      cfg.taplo.setup(make_defaults()) -- toml

      cfg.docker_compose_language_service.setup(make_defaults())

      cfg.graphql.setup(make_defaults())

      cfg.clangd.setup({
        on_attach = on_attach,
        filetypes_exclude = { "proto" },
      }) -- c, cpp, objc, objcpp, cuda, proto

      cfg.dockerls.setup(make_defaults())

      cfg.yamlls.setup({
        on_attach = on_attach,
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
        on_attach = on_attach,
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
