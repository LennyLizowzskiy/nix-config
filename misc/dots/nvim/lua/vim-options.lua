vim.opt.encoding = "utf8"

vim.opt.sessionoptions = {
  "blank",
  "buffers",
  "curdir",
  "folds",
  "terminal",
  "tabpages",
  "globals",
  "tabpages",
  "help",
  "winsize",
  "winpos",
  "localoptions",
}

-- hide cmdline when it's not used
-- vim.opt.cmdheight = 0

-- hide netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.opt.background = "dark"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.autoread = true

vim.opt.updatetime = 250
-- vim.opt.synmaxcol = 300

-- vim.opt.mouse = ""

vim.opt.undofile = true
vim.opt.undodir = vim.env.HOME .. "/.local/state/nvim/vim_undo"

vim.o.inccommand = "nosplit"

vim.o.scrolloff = 4

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true

vim.opt.signcolumn = "yes"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mousemoveevent = true

vim.opt.showmode = false

vim.opt.expandtab = true
vim.opt.shiftwidth = 4

vim.opt.scrolloff = 8

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.termguicolors = true

vim.opt.colorcolumn = "90"

vim.opt.clipboard = "unnamedplus"

vim.wo.fillchars = "eob:"

vim.o.visualbell = true

-- vim.opt.list = true
-- vim.opt.listchars:append({ trail = "•", tab = "»·" })

vim.opt.guicursor = {
  "n-v-c:block", -- Normal, visual, command-line: block cursor
  "i-ci-ve:ver25", -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
  "r-cr:hor20", -- Replace, command-line replace: horizontal bar cursor with 20% height
  "o:hor50", -- Operator-pending: horizontal bar cursor with 50% height
  "a:blinkwait700-blinkoff400-blinkon250", -- All modes: blinking settings
  "sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
}
