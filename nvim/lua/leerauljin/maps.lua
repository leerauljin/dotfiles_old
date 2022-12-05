local map = vim.keymap.set -- for conciseness

-- delete single character without copying into register
map("n", "x", '"_x')

-- navigate within insert mode
map("i", "<C-h>", "<Left>")
map("i", "<C-l>", "<Right>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")
map("n", "gw", "*N")
map("x", "gw", "*N")

-- lspsaga
map("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "show line diagnostics", silent = true })
map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { desc = "lsp finder", silent = true })
map("n", "gr", "<cmd>Lspsaga rename<CR>", { desc = "rename", silent = true })
map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { desc = "peek definition", silent = true })
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "hover", silent = true })

-- <leader>w : window management
map("n", "<leader>wv", "<C-w>v", { desc = "split window vertically" })
map("n", "<leader>ws", "<C-w>s", { desc = "split window horizontally" })
map("n", "<leader>we", "<C-w>=", { desc = "eqaulize split window" })
map("n", "<leader>wq", ":close<CR>", { desc = "close window" })
map("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "maximize split window" })

map("n", "<leader>wh", "<C-w>h", { desc = "window left" })
map("n", "<leader>wl", "<C-w>l", { desc = "window right" })
map("n", "<leader>wj", "<C-w>j", { desc = "window down" })
map("n", "<leader>wk", "<C-w>k", { desc = "window up" })

map("n", "<leader>w+", "<C-w>+", { desc = "increase height" })
map("n", "<leader>w-", "<C-w>-", { desc = "decrease height" })
map("n", "<leader>w>", "<C-w>>", { desc = "increase width" })
map("n", "<leader>w<", "<C-w><", { desc = "decrease width" })

-- <leader>f : file
map("n", "<leader>fs", ":w <CR>", { desc = "save file" })
map("n", "<leader>fS", ":w ", { desc = "save file as" })
map("n", "<leader>fR", ":sav ", { desc = "rename file" })
map("n", "<leader>fa", ":wa <CR>", { desc = "save all files" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "find files" })
map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "find files" })
map("n", "<leader>fb", "<cmd>Telescope file_browser<cr>", { desc = "open file browser" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "open recent file" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "live grep" })


-- <leader>q : quit
map("n", "<leader>qs", ":xa <CR>", { desc = "save all files and quit" })
map("n", "<leader>qq", ":qa <CR>", { desc = "quit all" })
map("n", "<leader>qQ", ":qa! <CR>", { desc = "quit all without saving" })


-- <leader>b : buffer
map("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "switch buffer" })
map("n", "<leader>bn", "<cmd> enew <CR>", { desc = "new buffer" })
map("n", "<leader>bs", ":w <CR>", { desc = "save buffer" })
map("n", "<leader>bS", ":wa <CR>", { desc = "save all buffers" })
map("n", "<leader>bd", ":bd <CR>", { desc = "kill buffer" })
map("n", "<leader>bD", ":bD <CR>", { desc = "kill buffer without saving" })
map("n", "<leader>br", ":bufdo :e <CR>", { desc = "refresh buffers" })


-- <leader>o : open
map("n", "<leader>oe", "<cmd>NvimTreeToggle <cr>", { desc = "open nvimtree" })


-- <leader>h : help / management
map("n", "<leader>ht", "<cmd>Telescope colorscheme<cr>", { desc = "change colorscheme" })
map("n", "<leader>hh", "<cmd>Telescope help_tags<cr>", { desc = "search help tags" })
map("n", "<leader>hk", "<cmd>Telescope keymaps<cr>", { desc = "search keymaps" })
map("n", "<leader>hp", ":PackerSync<CR>", { desc = "sync packages" })
map("n", "<leader>hl", ":LspRestart<CR>", { desc = "restart lsp" })


-- <leader>t : toggle
map("n", "<leader>tl", ":set nu! rnu!<CR>", { desc = "toggle line number" })
map("n", "<leader>tr", ":set rnu!<CR>", { desc = "toggle relative number" })
map("n", "<leader>tz", ":ZenMode<CR>", { desc = "toggle zen mode" })
map("n", "<leader>tl", ":TroubleToggle<CR>", { desc = "toggle trouble lsp diagnostics" })
map("n", "<leader>tt", "<cmd> Twilight<CR>", { desc = "toggle twilight" })



-- <leader>g : git
map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "git commits" })
map("n", "<leader>gf", "<cmd>Telescope git_bcommits<cr>", { desc = "git file/buffer commits" })
map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "git brances" })
map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "git status" })
-- map("n", "<leader>gg",
--     function() require("util").float_terminal("lazygit", { border = "none" }) end
--     , { desc = "open lazygit" })


-- depreciated
-- map({ "n", "t" }, "<leader>ot", ":ToggleTerm direction=horizontal <CR>",
--     { desc = "open horizontal terminal" })
-- map({ "n", "t" }, "<leader>oT", function() require("nvterm.terminal").toggle('vertical') end,
--     { desc = "open vertical terminal" }) -- open new tab
-- map({ "n", "t" }, "<leader>of", function() require("nvterm.terminal").toggle('float') end,
--     { desc = "open floating terminal" }) -- open new tab
