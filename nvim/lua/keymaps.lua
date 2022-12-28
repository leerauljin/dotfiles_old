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


-- Diagnsotic jump can use `<c-o>` to jump back
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- move code in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- make cursor stay when using J
map("n", "J", "mzJ`z")

-- greatest remap ever
map("x", "p", [["_dP]], { desc = "paste without yank"})

-- make cursor stay in center
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")


map("n", "Q", "<nop>")
map("n", "<leader>x", "", { silent = true })
