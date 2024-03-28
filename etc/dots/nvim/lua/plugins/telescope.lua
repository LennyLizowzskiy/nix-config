return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",

      "nvim-telescope/telescope-file-browser.nvim",
      {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
          "nvim-tree/nvim-web-devicons",
          "nvim-lua/plenary.nvim",
        },
      },
      {
        "nvim-telescope/telescope-project.nvim",
        dependencies = "nvim-telescope/telescope-file-browser.nvim",
      },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- TODO:
      "LukasPietzschmann/telescope-tabs",
      "debugloop/telescope-undo.nvim",
      "SalOrak/whaler.nvim",
      "axkirillov/easypick.nvim",
      "fdschmidt93/telescope-egrepify.nvim",
      "polirritmico/telescope-lazy-plugins.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    cmd = {
      "Telescope",
      "ChangeColorscheme",
      "ListKeymaps",
    },
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

      vim.api.nvim_create_user_command("ListColorschees", function()
        require("telescope.builtin").colorscheme()
      end, { desc = "List colorschemes (Telescope)" })

      vim.api.nvim_create_user_command("ListKeymaps", function()
        require("telescope.builtin").keymaps()
      end, { desc = "List keymaps (Telescope)" })

      ts.load_extension("fzf")
      ts.load_extension("project")
      ts.load_extension("file_browser")
      ts.load_extension("session-lens")
    end,
  },
}
