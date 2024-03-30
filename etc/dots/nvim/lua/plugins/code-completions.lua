return {
  {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      -- "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "petertriho/cmp-git",
      -- {
      --   "David-Kunz/cmp-npm",
      --   dependencies = { "nvim-lua/plenary.nvim" },
      --   ft = "json",
      --   config = function()
      --     require("cmp-npm").setup({})
      --   end,
      -- },
      "Saecki/crates.nvim",
      {
        url = "https://codeberg.org/FelipeLema/cmp-async-path.git",
      },
      {
        "saadparwaiz1/cmp_luasnip",
        dependencies = {
          {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
          },
        },
      },
      {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        opts = {},
      },
    },
    config = function()
      local cmp = require("cmp")
      -- local lspkind = require("lspkind")

      cmp.config.formatting = {
        format = require("tailwindcss-colorizer-cmp").formatter,
      }

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "async-path" },
          { name = "crates" },
        },
      })

      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "cmp_git" }, -- You can add another source here.
        }, {
          { name = "buffer" },
        }),
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },
}