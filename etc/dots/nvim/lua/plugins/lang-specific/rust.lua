return {
  {
    "saecki/crates.nvim",
    tag = "stable",
    event = { "BufRead Cargo.toml" },
    opts = {
      src = {
        cmp = { enabled = true },
      },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    init = function()
      local ext_path = vim.env.HOME .. "/.misc/dev/vscode-codelldb-adapter"
      local codelldb_path = ext_path .. "/adapter/codelldb"
      local liblldb_path = ext_path .. "/lldb/lib/liblldb.so" --  WARNING: linux only

      local cfg = require("rustaceanvim.config") -- Configure rustaceanvim here
      vim.g.rustaceanvim = {
        dap = {
          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
        server = {
          default_settings = {
            ["rust_analyzer"] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
              },
              checkOnSave = {
                allFeatures = true,
                command = "clippy",
              },
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
}