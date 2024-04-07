local mappings = shared.mappings
local commands = shared.commands

return {
  {
    "echasnovski/mini.clue",
    config = function()
      local clue = require("mini.clue")
      clue.setup({
        clues = {
          clue.gen_clues.builtin_completion(),
          clue.gen_clues.g(),
          -- miniclue.gen_clues.marks(),
          -- miniclue.gen_clues.registers(),
          clue.gen_clues.windows(),
          clue.gen_clues.z(),
        },

        triggers = {
          -- leader binds
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },

          -- g binds
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },

          -- windows
          { mode = "n", keys = "<C-w>" },

          -- z binds
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },
        },
      })
    end,
  },
  {
    "mrjones2014/legendary.nvim",
    priority = 10000,
    lazy = false,
    opts = {
      keymaps = {},
      commands = commands,
      funcs = {},
      extensions = {
        nvim_tree = false,
        op_nvim = false,
      },
    },
  },
}