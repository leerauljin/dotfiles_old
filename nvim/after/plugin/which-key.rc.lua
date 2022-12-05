local status, wk = pcall(require, 'which-key')
if (not status) then return end

wk.setup {
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
        border = "none", -- none/single/double/shadow
    },

    layout = {
        spacing = 6, -- spacing between columns
    },

    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },

    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        i = { "j", "k" },
        v = { "j", "k" },
    },
}

wk.register {
    ["<leader>"] = {
        f = {
            name = "+file"
        },
        b = {
            name = "+buffer"
        },
        w = {
            name = "+windows"
        },
        h = {
            name = "+help"
        },
        t = {
            name = "+toggle"
        },
        g = {
            name = "+git"
        },
        o = {
            name = "+open"
        }
    }
}
