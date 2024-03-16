return {
  {
    "smoka7/hop.nvim",
    cmd = {
      "HopWord",
      "HopChar1",
      "HopChar2",
      "HopPattern",
      "HopLine",
      "HopLineStart",
      "HopAnywhere",
    },
    keys = {
      { "<leader>ho", "<cmd>HopWord<cr>", desc = "Jump to any word (all windows)" },
      { "<leader>hO", "<cmd>HopWordMW<cr>", desc = "Jump to any word (all windows)" },
      { "<leader>hc", "<cmd>HopChar1<cr>", desc = "Jump to char" },
      { "<leader>hC", "<cmd>HopChar1MW<cr>", desc = "Jump to char (all windows)" },
      { "<leader>hf", "<cmd>HopChar2<cr>", desc = "Jump to 2 chars" },
      { "<leader>hF", "<cmd>HopChar2MW<cr>", desc = "Jump to 2 chars (all windows)" },
      { "<leader>hp", "<cmd>HopPattern<cr>", desc = "Jump to pattern" },
      { "<leader>hP", "<cmd>HopPatternMW<cr>", desc = "Jump to pattern (all windows)" },
      { "<leader>hl", "<cmd>HopLine<cr>", desc = "Jump to line" },
      { "<leader>hL", "<cmd>HopLineMW<cr>", desc = "Jump to line (all windows)" },
      { "<leader>hs", "<cmd>HopLineStart<cr>", desc = "Jump to line start" },
      { "<leader>hS", "<cmd>HopLineStartMW<cr>", desc = "Jump to line start (all windows)" },
    },
    opts = {},
  },
  {
    "atusy/treemonkey.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "<leader>st", "<cmd>lua require'treemonkey'.select{}<cr>", "Select part of code via TS" },
    },
  },
}
