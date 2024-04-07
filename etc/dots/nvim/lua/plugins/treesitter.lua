return {
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    main = "nvim-treesitter.configs",
    opts = {
      textobjects = {

      },
    },
  },
  {
    "RRethy/nvim-treesitter-endwise",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    main = "nvim-treesitter.configs",
    opts = {
      endwise = {
        enable = true,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VimEnter",
    opts = {

    }
  },
  {
    "RRethy/nvim-treesitter-textsubjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VimEnter",
    main = "nvim-treesitter.configs",
    opts = {
      textsubjects = {
        enable = true,
      },
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VimEnter",
    main = "rainbow-delimiters.setup",
    opts = {

    },
  },
  -- {
  --   "Wansmer/sibling-swap.nvim",
  --   dependencies = "nvim-treesitter/nvim-treesitter",
  --   event = "VimEnter",
  --   opts = {

  --   },
  -- },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VimEnter",
    -- opts = {}
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = function()
      require("nvim-treesitter.install").compilers = { "gcc" }

      local configs = require("nvim-treesitter.configs")
      configs.setup({
        indent = { enable = true },
        highlight = { enable = true },
        additional_vim_regex_highlighting = false,

        ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "bash",
          "cmake",
          "commonlisp",
          "cpp",
          "css",
          "csv",
          "diff",
          "dockerfile",
          "fish",
          "git_config",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "gitignore",
          "glsl",
          "graphql",
          "groovy",
          "hocon",
          "hlsl",
          "hocon",
          "html",
          "http",
          "hyprlang",
          "ini",
          "java",
          "javascript",
          "jq",
          "jsdoc",
          "json5",
          "jsonc",
          "just",
          "kdl",
          "kotlin",
          "lua",
          "luadoc",
          "luap",
          "make",
          "markdown",
          "markdown_inline",
          "meson",
          "nix",
          "odin",
          "properties",
          "proto",
          "printf",
          "python",
          "query",
          "ron",
          "rust",
          "scss",
          "slint",
          "smithy",
          "sql",
          "ssh_config",
          "strace",
          "textproto",
          "toml",
          "tsx",
          "typescript",
          "typst",
          "udev",
          "wgsl",
          "wgsl_bevy",
          "xml",
          "yaml",
          "zig",
        },
      })
    end,
  },
}