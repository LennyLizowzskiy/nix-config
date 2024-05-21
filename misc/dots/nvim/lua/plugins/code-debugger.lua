return {
  {
    "rcarriga/nvim-dap-ui",
    version = "3.*",
    dependencies = {
      "mfussenegger/nvim-dap",
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },
    event = "VeryLazy",
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
