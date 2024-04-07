local M = {};

local dap_ui_fts = {
  dapui_scopes = true,
  dapui_breakpoints = true,
  dapui_stacks = true,
  dapui_watches = true,
  ["dap-repl"] = true,
  dapui_console = true,
}
M.is_dap_ui_ft = function(ft)
  return dap_ui_fts[ft]
end

M.get_local_path = function()
  local path = vim.fn.expand("%:h")
  path = path:gsub("/home/" .. os.getenv("USER"), "~")
  return path
end

-- M.is_current_buf_in_dir = function(current_path, needed_dir)
--   local full_path = vim.fn.expand("%:p")

--   -- TODO:
-- end

_G.shared.funcs = _G.shared.funcs or M