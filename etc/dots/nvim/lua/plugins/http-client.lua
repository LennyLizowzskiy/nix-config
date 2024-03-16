return {
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = "http",
    opts = {
      result = {
        formatters = {
          json = "jaq",
        },
      },
    },
  },
}
