return {
  {
    "rcarriga/nvim-dap-ui",
    version = "3.*",
    dependencies = { "mfussenegger/nvim-dap", "theHamsta/nvim-dap-virtual-text" },
    event = "VeryLazy",
    keys = {
      { "<leader>dew", "<cmd>lua require'dapui'.toggle()<cr>", desc = "Toggle debug window" },
      { "<leader>des", "<cmd>lua require'dapui'.float_element('scopes', {})<cr>", desc = "Display the debug scope" },
      {
        "<leader>det",
        "<cmd>lua require'dapui'.float_element('stacks', {})<cr>",
        desc = "Display the running threads and their stack frames",
      },
      {
        "<leader>dew",
        "<cmd>lua require'dapui'.float_element('watches', {})<cr>",
        desc = "Display the debug context watchers",
      },
      {
        "<leader>deb",
        "<cmd>lua require'dapui'.float_element('breakpoints', {})<cr>",
        desc = "Display the debug breakpoints",
      },
      { "<leader>der", "<cmd>lua require'dapui'.float_element('repl', {})<cr>", desc = "Open REPL" },
      {
        "<leader>dec",
        "<cmd>lua require'dapui'.float_element('console', {})<cr>",
        desc = "Display the console window used by the debugger",
      },
    },
    config = function()
      local d, dui = require("dap"), require("dapui")

      dui.setup()

      require("nvim-dap-virtual-text").setup()
      d.listeners.before.attach.dapui_config = function()
        dui.open()
      end
      d.listeners.before.launch.dapui_config = function()
        dui.open()
      end
      d.listeners.before.event_terminated.dapui_config = function()
        dui.close()
      end
      d.listeners.before.event_exited.dapui_config = function()
        dui.close()
      end
    end,
  },
}