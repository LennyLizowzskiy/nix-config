_G.rust_autocheck_enable = true

return {
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    init = function()
      local autocmd = vim.api.nvim_create_autocmd

      -- autocmd({ "FileReadPost", "FileAppendPost", "TextChanged" }, {
      --   pattern = "rust",
      --   callback = function()
      --     if rust_autocheck_enable then
      --       vim.cmd("RustLsp flyCheck run")
      --     end
      --   end,
      -- })
      -- autocmd({ "LspAttach", "FileAppendPost", "TextChangedI" }, {
      --   pattern = { "rust" },
      --   command = "RustLsp flyCheck run",
      -- })
    end,
    config = function()
      local ext_path = vim.env.HOME .. "/.misc/dev/vscode-codelldb-adapter"
      local codelldb_path = ext_path .. "/adapter/codelldb"
      local liblldb_path = ext_path .. "/lldb/lib/liblldb.so" --  WARNING: linux only

      local cfg = require("rustaceanvim.config")
      vim.g.rustaceanvim = {
        dap = {
          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
        server = {
          on_attach = function(client, bufnr)
            vim.lsp.inlay_hint.enable(bufnr)
          end,
          default_settings = {
            ["rust_analyzer"] = {
              imports = {
                granularity = {
                  group = "module",
                },
                prefix = "self",
              },
              cargo = {
                allFeatures = true,
                targetDir = true,
                buildScripts = {
                  enable = true,
                },
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
              },
              check = {
                command = "clippy",
                allTargets = false,
                extraArgs = { "--no-deps" },
              },
              ["check.command"] = "clippy",
              checkOnSave = false,
              procMacro = {
                enable = true,
                ignored = {
                  leptos_macro = {
                    "server",
                  },
                },
              },
            },
          },
        },
      }
    end,
  },
  {
    "saecki/Crates.nvim",
    tag = "stable",
    event = { "BufRead Cargo.toml" },
    opts = {},
  },
}