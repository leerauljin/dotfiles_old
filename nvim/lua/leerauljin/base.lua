local g = vim.g
local o = vim.o
local opt = vim.opt

--general
o.termguicolors = true

o.timeoutlen = 500
o.updatetime = 200

o.scrolloff = 8

o.backspace = "indent,eol,start"

o.clipboard = "unnamedplus"

o.history = 50

opt.mouse = "a"

g.mapleader = " "
g.maplocalleader = " "

--file management
vim.scriptencoding = 'utf-8'
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'

o.undofile = true

-- ui
o.number = true
o.relativenumber = true

o.cursorline = true
o.signcolumn = "yes"
o.cmdheight = 1
-- o.background = "dark"

o.title = true

-- editor
o.wrap = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = -1
o.expandtab = true
o.autoindent = true

o.list = true
o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"

o.splitright = true
o.splitbelow = true

o.ignorecase = true
o.smartcase = true
o.hlsearch = true


-- other
-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = '*',
    command = "set nopaste"
})
