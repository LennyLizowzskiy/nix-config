return {
  {
    "rmagatti/auto-session",
    event = "VeryLazy",
    opts = {
      auto_save_enabled = true,
      auto_restore_enabled = false,
      auto_session_suppress_dirs = {
        "~/",
        "~/Downloads",
        "/",
        "~/@",
        "~/@/projects"
      },
    }
  },
}