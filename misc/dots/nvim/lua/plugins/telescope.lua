local function load(ext_name)
  require("telescope").load_extension(ext_name)
end

return {
  {
    "LukasPietzschmann/telescope-tabs",
    dependencies = "nvim-telescope/telescope.nvim",
    config = function()
      load("telescope-tabs")
      require("telescope-tabs").setup({
        
      })
    end,
  },
  -- {
  --   "nvim-telescope/telescope-file-browser.nvim",
  --   dependencies = {
  --     "nvim-telescope/telescope.nvim",

  --     "nvim-tree/nvim-web-devicons",
  --     "nvim-lua/plenary.nvim",
  --   },
  --   config = function()
  --     load("file_browser")
  --   end,
  -- },
  -- {
  --   "nvim-telescope/telescope-project.nvim",
  --   dependencies = "nvim-telescope/telescope.nvim"
  --   config = function()
  --     load("project")
  --   end,
  -- },
  {
    "debugloop/telescope-undo.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
    config = function()
      local ts = require("telescope")
      ts.setup({
        extensions = {
          undo = {
            use_delta = true,
          },
        },
      })
      ts.load_extension("undo")
    end,
  },
  {
    "SalOrak/whaler.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
    config = function()
      local ts = require("telescope")
      ts.setup({
        extensions = {
          whaler = {
            directories = {
              "~/@/projects",
            },
            file_explorer = "neotree",
          },
        },
      })
      ts.load_extension("whaler")
    end,
  },
  {
    "axkirillov/easypick.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {

      },
    }
  },
  {
    "fdschmidt93/telescope-egrepify.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
    config = function()
      load("egrepify")
    end,
  },
  {
    "polirritmico/telescope-lazy-plugins.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
    config = function()
      load("lazy_plugins")
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
    config = function()
      local ts = require("telescope")
      ts.setup({
        extensions = {
          ["ui-select"] = {

          },
        },
      })
      ts.load_extension("ui-select")
    end,
  },
  {
    "rmagatti/session-lens",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      {
        "rmagatti/auto-session",
        dependencies = "nvim-telescope/telescope.nvim",
        opts = {
          auto_save_enabled = true,
          auto_restore_enabled = false,
          auto_session_suppress_dirs = {
            "~/",
            "~/Downloads",
            "/",
            "~/@",
            "~/@/projects",
          },
        },
      },
    },
    config = function()
      load("session-lens")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = {
      "Telescope",
      "ChangeColorscheme",
      "ListKeymaps",
    },
    lazy = false,
    config = function()
      local ts = require("telescope")
      ts.setup({
        defaults = {
          path_display = { "smart", "truncate" },
          dynamic_preview_title = true,
          results_title = false,
          treesitter = true,
          file_ignore_patterns = {
            "node_modules",
            "/nix/store",
          },
          layout_config = {
            horizontal = {
              preview_width = 0.65,
            },
          },
        },

        extensions = {
          cmdline = {
            picker = {
              layout_config = {
                width = 40,
                height = 20,
              },
            },
            mappings = {},
          },
        },
      })

      ts.load_extension("fzf")
    end,
  },
}
