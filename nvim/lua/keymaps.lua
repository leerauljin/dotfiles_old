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
