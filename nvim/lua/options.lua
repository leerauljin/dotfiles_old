local o = vim.opt

vim.scriptencoding = 'utf-8'
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'

--linenumbers
o.relativenumber = true
o.number = true

-- tabs & indentation
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.autoindent = true

-- search
o.ignorecase = true
o.smartcase = true
o.hlsearch = true

o.backspace = "indent,eol,start"

o.clipboard:append("unnamedplus")

o.splitright = true
o.splitbelow = true

o.iskeyword:append("-")

o.title = true

o.undofile = true
-- ui related
o.cursorline = true
o.termguicolors = true
o.signcolumn = "yes"
o.cmdheight = 1
o.background = "dark"
o.wrap = false

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = '*',
    command = "set nopaste"
})




-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
