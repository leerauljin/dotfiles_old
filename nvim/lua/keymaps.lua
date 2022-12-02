-- set leader key to space
vim.g.mapleader = " "

local m = vim.keymap -- for conciseness

-- delete single character without copying into register
m.set("n", "x", '"_x')

-- window management
m.set("n", "<leader>sv", "<C-w>v") -- split window vertically
m.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
m.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
m.set("n", "<leader>sx", ":close<CR>") -- close current split window

m.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
m.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
m.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
m.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

m.set({ "n", "t" }, "<leader>tt", function() require("nvterm.terminal").toggle('horizontal') end) -- open new tab
----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
m.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
m.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
m.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
m.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
m.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
m.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
m.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
m.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
m.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
m.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
m.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
m.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

m.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })
