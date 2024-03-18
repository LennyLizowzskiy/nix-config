return {
  {
    "rest-nvim/rest.nvim",
    dependencies = { {
      "vhyrro/luarocks.nvim",
      opts = {},
    } },
    ft = "http",
    config = function()
      require("rest-nvim").setup()
    end,
  },
}