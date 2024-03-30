return {
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    event = "VeryLazy",
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- opts = {
    --   mappings = {},
    -- },
  },
  {
    "preservim/vim-pencil",
    cmd = {
      "Pencil",
      "NoPencil",
      "PencilOff",
      "TogglePencil",
      "PencilToggle",
      "SoftPencil",
      "PencilSoft",
      "HardPencil",
      "PencilHard",
    },
  },
}