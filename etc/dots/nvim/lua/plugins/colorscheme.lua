return {
  -- {
  --   "projekt0n/github-nvim-theme",
  --   lazy = false,
  --   priority = 999,
  --   config = function()
  --     require("github-theme").setup()
  --
  --     -- vim.cmd.colorscheme("github_dark_default")
  --   end,
  -- },
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   lazy = false,
  --   priority = 999,
  --   opts = {},
  --   config = function(opts)
  --     require("gruvbox").setup(opts)
  --
  --     -- vim.o.background = "dark"
  --     -- vim.cmd.colorscheme("gruvbox")
  --   end,
  -- },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin-theme",
  --   lazy = false,
  --   priority = 999,
  --   opts = {},
  --   config = function(opts)
  --     -- require("catppuccin").setup(opts)
  --
  --     -- vim.cmd.colorscheme("catppuccin-macchiato")
  --   end,
  -- },
  -- {
  --   "rebelot/kanagawa.nvim",
  --   name = "kanagawa-theme",
  --   lazy = false,
  --   priority = 999,
  --   opts = {},
  --   config = function(opts)
  --     --   require("kanagawa").setup(opts)
  --
  --     -- vim.cmd.colorscheme("kanagawa")
  --   end,
  -- },
  -- {
  --   "nyoom-engineering/oxocarbon.nvim",
  --   lazy = false,
  --   priority = 999,
  --   config = function()
  --     -- vim.opt.background = "dark"
  --     -- vim.cmd.colorscheme("oxocarbon")
  --   end,
  -- },
  -- {
  --   "embark-theme/vim",
  --   name = "embark-theme",
  --   lazy = false,
  --   priority = 999,
  --   config = function()
  --     -- vim.cmd.colorscheme("embark")
  --   end,
  -- },
  {
    "rose-pine/neovim",
    name = "rose-pine-theme",
    lazy = false,
    priority = 999,
    config = function()
      -- vim.cmd.colorscheme("rose-pine-moon")
    end,
  },
  {
    "ramojus/mellifluous.nvim",
    name = "mellifluos-theme",
    lazy = false,
    priority = 999,
    config = function()
      require("mellifluous").setup({
        color_set = "kanagawa_dragon",
      })

      vim.cmd.colorscheme("mellifluous")
    end,
  },
}
