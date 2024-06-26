local mappings = shared.mappings

return {
  {
    "petertriho/cmp-git",
    opts = {},
  },
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
        dependencies = "L3MON4D3/LuaSnip",
      },
      {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        opts = {},
      },
      "kristijanhusak/vim-dadbod-completion",
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
          {
            { name = "git" },
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "async_path" },
            { name = "crates" },
          },
          {
            { name = "buffer" },
          },
          {
            { name = "vim-dadbod-completion" },
          }
        },
        experimental = {
          ghost_text = {
            hl_group = "Comment",
          },
        },
        mapping = cmp.mapping.preset.insert({
          -- ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          [mappings.sub_windows.list.select_next] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          -- ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          [mappings.sub_windows.list.select_prev] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          [mappings.sub_windows.list.scroll_up] = cmp.mapping.scroll_docs(-4),
          [mappings.sub_windows.list.scroll_down] = cmp.mapping.scroll_docs(4),
          -- ["<C-Space>"] = cmp.mapping.complete(),
          [mappings.sub_windows.list.abort] = cmp.mapping.abort(),
          [mappings.sub_windows.list.confirm.main] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          -- ["<S-Tab>"] = cmp.mapping.confirm({
          --   behavior = cmp.ConfirmBehavior.Replace,
          --   select = true,
          -- }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          -- ["<C-Tab>"] = function(fallback)
          --   cmp.abort()
          --   fallback()
          -- end,
        }),
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