local ok, wk = pcall(require, 'which-key')
if not ok then return end

local conf = {
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "  ", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },

    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },

    window = {
        border = 'single',
        position = 'bottom',
    },

    layout = {
        spacing = 6, -- spacing between columns
    },

    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },

    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        i = { "j", "k" },
        n = { "d", "y", "c" },
        v = { "j", "k" },
    },
}

local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}

local mappings = {
    q = {
        name = "+quit",
        l = { "<cmd>SessionLoad<cr>", "reload last session" },
        s = { ":xa <CR>", "save all files and quit" },
        q = { ":qa <CR>", "quit all" },
        Q = { ":qa! <CR>", "quit all without saving" },

    },

    f = {
        name = "+file",

        s = { ":w <CR>", "save file" },
        n = { ":e ", "new file" },
        S = { ":w ", "save file as" },
        R = { ":sav ", "rename file" },
        a = { ":wa <CR>", "save all files" },
        f = { "<cmd>Telescope find_files<cr>", "find files" },
        b = { "<cmd>Telescope file_browser<cr>", "open file browser" },
        r = { "<cmd>Telescope oldfiles<cr>", "open recent file" },
        w = { "<cmd>Telescope live_grep<cr>", "live grep" },
    },
    b = {
        name = "+buffer",
        b = { "<cmd>Telescope buffers<cr>", "switch buffer" },
        n = { "<cmd> enew <CR>", "new buffer" },
        s = { ":w <CR>", "save buffer" },
        S = { ":wa <CR>", "save all buffers" },
        d = { ":bd <CR>", "kill buffer" },
        D = { ":bD <CR>", "kill buffer without saving" },
        r = { ":bufdo :e <CR>", "refresh buffers" },
    },
    w = {
        name = "+windows",
        v = { "<C-w>v", "split window vertically" },
        s = { "<C-w>s", "split window horizontally" },
        e = { "<C-w>=", "eqaulize split window" },
        q = { ":close<CR>", "close window" },
        m = { ":MaximizerToggle<CR>", "maximize split window" },

        h = { "<C-w>h", "window left" },
        l = { "<C-w>l", "window right" },
        j = { "<C-w>j", "window down" },
        k = { "<C-w>k", "window up" },

        ["+"] = { "<C-w>+", "increase height" },
        ["-"] = { "<C-w>-", "decrease height" },
        [">"] = { "<C-w>>", "increase width" },
        ["<"] = { "<C-w><", "decrease width" },
    },
    h = {
        name = "+help",

        t = { "<cmd>Telescope colorscheme<cr>", "change colorscheme" },
        h = { "<cmd>Telescope help_tags<cr>", "search help tags" },
        k = { "<cmd>Telescope keymaps<cr>", "search keymaps" },
        s = { ":PackerSync<CR>", "sync packages" },
        p = { ":PackerProfile<CR>", "packer profile" },
        l = { ":LspRestart<CR>", "restart lsp" },
    },
    t = {
        name = "+toggle",
        n = { ":set nu! rnu!<CR>", "toggle line number" },
        r = { ":set rnu!<CR>", "toggle relative number" },
        z = { ":ZenMode<CR>", "toggle zen mode" },
        l = { ":TroubleToggle<CR>", "toggle trouble lsp diagnostics" },
        d = { ":TodoTrouble<CR>", "toggle todo list" },
        t = { "<cmd> Twilight<CR>", "toggle twilight" },
    },
    g = {
        name = "+git",
        g = { ":Neogit kind=split<cr>", "open neogit (split)" },
        G = { ":Neogit<cr>", "open neogit (fullscreen)" },
        c = { ":Neogit commit<cr>", "git commit" },
    },
    o = {
        name = "+open",
        e = { ":NvimTreeToggle<cr>", "file explorer" },
    }
}

wk.setup(conf)
wk.register(mappings, opts)
