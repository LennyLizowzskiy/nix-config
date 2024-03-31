local icons = shared.icons
local mappings = shared.mappings.sub_windows

return {
  -- {
  --   "echasnovski/mini.files",
  --   version = "*",
  --   event = "VeryLazy",
  --   opts = {},
  -- },
  -- {
  --   "ms-jpq/chadtree",
  --   branch = "chad",
  --   make = { "python3 -m chadtree deps", ":CHADdeps" },
  --   event = "VimEnter",
  -- },
  {
    "miversen33/netman.nvim",
    config = function()
      require("netman")
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "v3.*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",

      -- "mrbjarksen/neo-tree-diagnostics.nvim",
      "miversen33/netman.nvim",
      "antosha417/nvim-lsp-file-operations",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false,
    priority = 9,
    config = function()
      vim.fn.sign_define("DiagnosticSignError",
        { text = icons.error .. " ", texthl = "DiagnosticSignError" })
      vim.fn.sign_define("DiagnosticSignWarn",
        { text = icons.warn .. " ", texthl = "DiagnosticSignWarn" })
      vim.fn.sign_define("DiagnosticSignInfo",
        { text = icons.info .. " ", texthl = "DiagnosticSignInfo" })
      vim.fn.sign_define("DiagnosticSignHint",
        { text = icons.hint .. " ", texthl = "DiagnosticSignHint" })

      require("neo-tree").setup({
        sources = {
          "filesystem",
          -- "buffers",
          "git_status",
          -- "document_symbols",

          -- "diagnostics", -- mrbjarksen/neo-tree-diagnostics.nvim
          "netman.ui.neo-tree", -- miversen33/netman.nvim
        },

        enable_git_status = true,
        enable_diagnostics = true,

        default_component_configs = {
          icon = {
            folder_closed = icons.file_manager.directory_inactive,
            folder_open = icons.file_manager.directory_active,
            folder_empty = icons.file_manager.directory_empty,
            default = icons.file_manager.file,
          },
          git_status = {
            symbols = {
              added = icons.vcs.added,
              modified = icons.vcs.modified,
              deleted = icons.vcs.deleted,
              renamed = icons.vcs.renamed,
              untracked = icons.vcs.untracked,
              ignored = icons.vcs.ignored,
              unstaged = icons.vcs.unstaged,
              staged = icons.vcs.staged,
              conflict = icons.vcs.conflict,
            },
          },
        },

        filesystem = {
          hijack_netrw_behavior = "open_current",
        },

        window = {
          mappings = {
            [mappings.file_manager.node_toggle] = "toggle_node",
            [mappings.file_manager.open] = "open",
            [mappings.file_manager.cancel] = "cancel",
            [mappings.file_manager.preview_toggle] = {
              "toggle_preview",
              config = {
                use_float = true,
                use_image_nvim = true,
              },
            },
            [mappings.file_manager.preview_goto] = "focus_preview",
            [mappings.file_manager.open_vsplit] = "open_vsplit",
            [mappings.file_manager.open_hsplit] = "open_split",
            [mappings.file_manager.open_newtab] = "open_tabnew",
            [mappings.file_manager.node_subnodes_close] = "close_all_subnodes",
            [mappings.file_manager.nodes_all_close] = "close_all_nodes",
            [mappings.file_manager.nodes_all_open] = "expand_all_nodes",
            [mappings.file_manager.add] = "add",
            [mappings.file_manager.delete] = "delete",
            [mappings.file_manager.rename] = "rename",
            [mappings.file_manager.copy_to_clipboard] = "copy_to_clipboard",
            [mappings.file_manager.cut_to_clipboard] = "cut_to_clipboard",
            [mappings.file_manager.paste_from_clipboard] = "paste_from_clipboard",
            [mappings.file_manager.yank] = "copy",
            [mappings.file_manager.move] = "move",
            [mappings.file_manager.close_fm] = "close_window",
            [mappings.file_manager.refresh] = "refresh",
            [mappings.file_manager.help] = "show_help",
            [mappings.file_manager.source_prev] = "prev_source",
            [mappings.file_manager.source_next] = "next_source",
            [mappings.file_manager.file_details] = "show_file_details",
          },
        },
      })

      require("lsp-file-operations").setup()
    end,
  },
}
