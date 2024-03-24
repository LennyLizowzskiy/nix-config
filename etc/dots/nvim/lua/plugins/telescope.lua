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
      {
        "rmagatti/session-lens",
        dependencies = "rmagatti/auto-session",
      },
    },
    cmd = {
      "Telescope",
      "ChangeColorscheme",
      "ListKeymaps",
    },
    keys = {
      { "<leader>bl", "<cmd>Telescope buffers<cr>", desc = "Search through buffers" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Search through files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Search through files' contents" },
      { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Search through git files" },
      { "<leader>fm", "<cmd>Telescope file_browser<cr>", desc = "Browse files (Telescope)" },
      { "<leader>pr", "<cmd>Telescope project<cr>", desc = "Open project manager" },
      { "<leader>cf", "<cmd>Telescope oldfiles<cr>", desc = "Search through closed files" },
      -- { "<leader>cmds", "<cmd>Telescope commands<cr>", desc = "Search through vim commands" },
      { "<leader>lss", "<cmd>Telescope lsp_document_symbols<cr>", desc = "List LSP symbols (buffer)" },
      { "<leader>lsS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "List LSP symbols (workspace)" },
      { "<leader>lsi", "<cmd>Telescope lsp_implementations<cr>", desc = "Goto/see LSP implementations(s)" },
      { "<leader>lsdf", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto/see LSP definitions(s)" },
      { "<leader>lstd", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto/see LSP type definition(s)" },
      -- { ":", "<cmd>Telescope cmdline<cr>", desc = "Vim cmdline" },
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
      -- ts.load_extension("cmdline")
    end,
  },
}
