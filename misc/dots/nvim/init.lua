local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("shared")

-- vim.cmd("runtime! lua/*.lua")
require("vim-options")

require("lazy").setup({
  { import = "plugins" },
  { import = "plugins.lang-specific" },
  { import = "plugins.bindings" },
}, {
  change_detection = {
    notify = false,
  },
})
