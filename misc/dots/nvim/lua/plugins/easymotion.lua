local mappings = shared.mappings

return {
  {
    "smoka7/hop.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      {
        mappings.easymotion.jump_to_word.n,
        [[<cmd>HopWord<cr>]],
        desc = "Jump to word",
      },
      {
        mappings.easymotion.jump_to_char1.n,
        [[<cmd>HopChar1<cr>]],
        desc = "Jump to char",
      },
      {
        mappings.easymotion.jump_to_char2.n,
        [[<cmd>HopChar2<cr>]],
        desc = "Jump to 2 chars",
      },
      {
        mappings.easymotion.jump_to_pattern.n,
        [[<cmd>HopPattern<cr>]],
        desc = "Jump to pattern (like /)",
      },
      {
        mappings.easymotion.jump_to_ts_node.n,
        [[<cmd>HopNodes<cr>]],
        desc = "Jump to TS node",
      },
      {
        mappings.easymotion.jump_anywhere.n,
        [[<cmd>HopAnywhere<cr>]],
        desc = "Jump anywhere",
      },
    },
    opts = {},
  },
  {
    "atusy/treemonkey.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      {
        mappings.easymotion.select_ts_node.n,
        [[<cmd>lua require("treemonkey").select({ highlight = { backdrop = "Comment" } })<cr>]]
      }
    },
  },
}
