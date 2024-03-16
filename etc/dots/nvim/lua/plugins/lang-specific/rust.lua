return {
  {
    "mrcjkb/rustaceanvim",
    ft = { "rust" },
    config = function()
      local ext_path = vim.env.HOME .. "/.vim/etc/vscode-codelldb"
      local codelldb_path = ext_path .. "/adapter/codelldb"
      local liblldb_path = ext_path .. "/lldb/lib/liblldb.so" --  WARNING: linux only

      local cfg = require("rustaceanvim.config")
      vim.opt.rustaceanvim = {
        dap = {
          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
        server = {
          default_settings = {
            ["rust_analyzer"] = {
              checkOnSave = {
                command = "clippy",
              },
            },
          },
        },
      }
    end,
  },
}
