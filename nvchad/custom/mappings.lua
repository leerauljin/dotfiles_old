--easymotion/vim-easymotion lua/custom/mappings 
local M = {}

M.disabled = {
  n ={
    ["s"] = "",
    ["S"] = "",
    ["H"] = "",
    ["L"] = "",
    ["<leader>n"] = "",
    ["<leader>rn"] = "",
    ["<leader>fm"] = "",
    ["<leader>fo"] = "",
    ["<leader>wa"] = "",
    ["<leader>wr"] = "",
    ["<leader>wl"] = "",
    ["<leader>cm"] = "",
    ["<leader>x"] = "",
    ["<leader>h"] = "",
    ["<leader>v"] = "",
  }
}

M.general = {
  i = {
    [";;"] = { "<Esc>" },
  },
  n = {
    -- close buffer + hide terminal buffer
    ["<leader>d"] = {
      function()
        require("core.utils").close_buffer()
      end,
      "   close buffer",
    },
    ["H"] = { "^" },
    ["L"] = { "$" },

    -- hop related
    ["s"] = { "<cmd> HopChar2AC <CR>", "Go to bigram (After cursor)"},
    ["S"] = { "<cmd> HopChar2BC <CR>", "Go to bigram (Before cursor)"},
    ["<leader>j"] = { "<cmd> HopLineStartAC <CR>", "Go to line (After cursor)"},
    ["<leader>k"] = { "<cmd> HopLineStartBC <CR>", "Go to line (Before cursor)"},
    --
    -- ["<C-q>"] = {
    --   function()
    --     require("core.utils").close_buffer()
    --   end,
    --   "   close buffer",
    -- },
  }
}

-- <leader> + b : buffer related
M.buffer = {
  n = {
    -- Save
    ["<leader>bs"] = { "<cmd> w <CR>", "﬚  save file"},

    -- Copy all
    ["<leader>by"] = { "<cmd> %y+ <CR>", "  copy whole file" },

    -- Open new buffer
    ["<leader>bn"] = { "<cmd> enew <CR>", "烙 new buffer" },

    -- pick buffers via numbers
    ["<leader>b."] = { "<cmd> TbufPick <CR>", "  Pick buffer" },

  },
}

-- <leader> + t : toggle related
M.toggle = {
  n ={
    -- line numbers
    ["<leader>tn"] = { "<cmd> set nu! <CR>", "   toggle line number" },

    ["<leader>tr"] = { "<cmd> set rnu! <CR>", "   toggle relative number" },

    -- toggle nvimtree
    ["<leader>tt"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
  },
}

-- <leader> + o : open related
-- Nvterm related

M.nvterm = {
  n = {
    -- toggle in normal mode
    ["<leader>ot"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "   toggle floating term",
    },

    ["<leader>oh"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "   toggle horizontal term",
    },

    ["<leader>ov"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "   toggle vertical term",
    },
  }
}

-- <leader> + q : Quit related
M.quit = {
  n ={
    -- line numbers
    ["<leader>qq"] = { "<cmd> q <CR>", "Quit" },
    ["<leader>qQ"] = { "<cmd> q! <CR>", "Quit" },
    ["<leader>qw"] = { "<cmd> wq <CR>", "Write and quit" },
  },
}

-- <leader> + l : LSP related
M.lsp = {
  n = {
    ["<leader>la"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "   add workspace folder",
    },

    ["<leader>lr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "   remove workspace folder",
    },

    ["<leader>ll"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "   list workspace folders",
    },
  }
}

-- <leader> + f : Find related
M.find = {
  n = {
    ["<leader>fr"] = { "<cmd> Telescope oldfiles <CR>", "   find oldfiles" },
  }
}

-- <leader> + g : Git related
M.git = {
  n = {
    ["<leader>gm"] = { "<cmd> Telescope git_commits <CR>", "   git commits" },
  }
}


-- <leader> + h : Helper related
M.help = {
  n = {
    ["<leader>hm"] = { "<cmd> Mason <CR>", "Mason" },

    ["<leader>hp"] = { "<cmd> PackerStatus <CR>", "Packer status" },

    ["<leader>hu"] = { "<cmd> PackerUpdate <CR>", "Packer update" },

    ["<leader>hs"] = { "<cmd> PackerSync <CR>", "Packer sync" },

  }
}


return M
