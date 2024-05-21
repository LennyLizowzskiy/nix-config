_G.shared.commands = _G.shared.commands or {
  {
    "DebugUIToggleWindow",
    function()
      require("dapui").toggle()

      -- TODO: add rust debugger ui
    end,
    description = "Toggle debug UI",
  },
  {
    "DebugUIToggleElementHover",
    function()
      require("dapui").float_element()
    end,
    description = "Show debug info of an element",
  },

  {
    "TestRunNear",
    function()
      require("neotest").run.run()
    end,
    description = "Run the nearest test",
  },
  {
    "TestRunDebugNear",
    function()
      require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
    end,
    description = "Run the nearest test with debugger",
  },
  {
    "TestRunLast",
    function()
      require("neotest").run.run_last()
    end,
  },
  {
    "TestRunDebugLast",
    function()
      require("neotest").run.run_last({ strategy = "dap" })
    end,
    description = "Run the nearest test with debugger",
  },
  {
    "TestStopNear",
    function()
      require("neotest").run.stop()
    end,
    description = "Stop the nearest test",
  },
  {
    "TestAttachNear",
    function()
      require("neotest").run.attach()
    end,
    description = "Attach to the nearest test",
  },
  {
    "TestOutputShow",
    function()
      require("neotest").output.open({
        short = true,
        enter = true,
        quiet = true,
        last_run = true,
        auto_close = true,
      })
    end,
    description = "Display output of tests",
  },
  {
    "TestOutputPanelToggle",
    function()
      require("neotest").output_panel.toggle()
    end,
    description = "Toggle the test output panel",
  },
  {
    "TestOutputPanelClear",
    function()
      require("neotest").output_panel.clear()
    end,
    description = "Clear the test output panel"
  },
  {
    "TestSummaryWindowToggle",
    function()
      require("neotest").summary.toggle()
    end,
    description = "Toggle the test summary window"
  },
  {
    "TestSummaryMarkedRun",
    function()
      require("neotest").summary.run_marked()
    end,
    description = "Run all marked positions",
  },
  {
    "TestSummaryMarkedClear",
    function()
      require("neotest").summary.clear_marked()
    end,
    description = "Clear all marked positions",
  },
  {
    "TestJumpNext",
    function()
      require("neotest").jump.next()
    end,
    description = "Jump to the next test",
  },
  {
    "TestJumpNextFailed",
    function()
      require("neotest").jump.next({ status = "failed", })
    end,
    description = "Jump to the next failed test",
  },
  {
    "TestJumpPrev",
    function()
      require("neotest").jump.prev()
    end,
    description = "Jump to the prev test",
  },
  {
    "TestJumpPrevFailed",
    function()
      require("neotest").jump.prev({ status = "failed", })
    end,
    description = "Jump to the prev failed test",
  },
}