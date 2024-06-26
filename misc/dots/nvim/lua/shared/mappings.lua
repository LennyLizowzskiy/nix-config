_G.shared.mappings = _G.shared.mappings or {
  sub_windows = {
    picker = {
      result_select_next = {
        i = "<C-j>",
        n = "j",
      },
      result_select_prev = {
        i = "<C-k>",
        n = "h",
      },

      preview_scroll_down = {
        i = "<C-b>",
        n = "B",
      },
      preview_scroll_up = {
        i = "<C-B>",
        n = "B",
      },

      results_scroll_down = {
        i = "<C-f>",
        n = "f",
      },
      results_scroll_up = {
        i = "<C-F>",
        n = "F",
      },
      results_send_to_quickfix = {
        i = "<C-l>",
        n = "l",
      },

      close = {
        i = "<C-q>",
        n = "<esc>",
      },

      help = {
        i = "<C-/>",
        n = "?",
      },
      confirm = "<CR>",
    },

    list = {
      select_next = "<C-j>",
      select_prev = "<C-k>",
      scroll_up = "<C-b>",
      scroll_down = "<C-f>",
      -- complete = "<C-Space>",
      abort = "<C-e>",
      confirm = {
        -- variants
        "<S-Tab>",
        "<C-Tab>",

        main = "<Tab>",
      },
      close = "<esc>",
      help = "<C-/>",
    },

    sub_buffer = {
      open = "<C-c>o",
      open_vsplit = "<C-c>s",
      open_hsplit = "<C-c>S",
      open_newtab = "<C-c>t",
      quit = "<C-c>q",
      close = "<C-c>k",
    },

    file_manager = {
      open = "<CR>",
      open_vsplit = "s",
      open_hsplit = "S",
      open_newtab = "t",
      search = "/",
      preview_toggle = "P",
      preview_goto = "p",
      file_details = "i",
      cancel = "<esc>",
      node_toggle = "z",
      -- node_close = "n",
      node_subnodes_close = "n",
      nodes_all_close = "N",
      -- node_open = "b",
      nodes_all_open = "B",
      add = "a",
      delete = "d",
      rename = "r",
      yank = "y",
      copy_to_clipboard = "c",
      cut_to_clipboard = "x",
      paste_from_clipboard = "p",
      move = "m",
      select = "e",
      help = "?",
      source_prev = "h",
      source_next = "l",
      refresh = "R",
      root_set = ".",
      hidden_toggle = "H",
      close_fm = "q",
    },
  },

  lsp = { -- also "code"
    hover_toggle = {
      i = "<C-h>",
      n = "<leader>ch"
    },
    rename = {
      n = "<leader>cr",
    },
    code_actions_open = {
      i = "<C-Space>",
      n = "<leader>ca",
    },
    diagnostics_next = "<leader>cn",
    diagnostics_prev = "<leader>cb",
    diagnostics_list = {
      i = "<C-i>",
      n = "<leader>ci",
    },
    diagnostics_list_variant = {
      n = "<leader>cI",
    },
    definition = {
      n = "<leader>cd",
    },
    type_definition = {
      n = "<leader>ct",
    },
    declaration = {
      n = "<leader>ce",
    },
    reference = {
      n = "<leader>cr",
    },
    implementation = {
      n = "<leader>cm",
    },
    inlay_hint_toggle = {
      n = "<leader>cK",
    },
    code_outline = {
      n = "<leader>co",
    },
    search = {
      n = "<leader>cs",
    },
  },

  terminal = {
    toggle = {
      n = "<leader>tt",
    },
  },

  easymotion = {
    jump_to_word = {
      n = "<leader>hw",
    },
    jump_to_char1 = {
      n = "<leader>hc",
    },
    jump_to_char2 = {
      n = "<leader>hC",
    },
    jump_to_pattern = {
      n = "<leader>hs",
    },
    jump_to_ts_node = {
      n = "<leader>ht",
    },
    jump_anywhere = {
      n = "<leader>ha",
    },

    select_ts_node = {
      n = "<leader>st",
    },
  },
}