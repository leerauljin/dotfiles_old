local status, lualine = pcall(require, "lualine")
if (not status) then return end

local colors = require('everblush.core').get_colors()
local scheme = {
    normal = {
        a = { fg = colors.color2, bg = colors.background },
        b = { fg = colors.color7, bg = colors.background },
        c = { bg = colors.background },
    },

    insert = {
        a = { bg = colors.color4, fg = colors.background },
        b = { fg = colors.color7, bg = colors.background },
        c = { bg = colors.background },
    },

    command = {
        a = { bg = colors.color1, fg = colors.background },
        b = { fg = colors.color7, bg = colors.background },
        c = { bg = colors.background },
    },

    visual = {
        a = { bg = colors.color5, fg = colors.background },
        b = { fg = colors.color7, bg = colors.background },
        c = { bg = colors.background },
    },

    replace = {
        a = { bg = colors.color1, fg = colors.background },
        b = { fg = colors.color7, bg = colors.background },
        c = { bg = colors.background },
    },

    inactive = {
        a = { fg = colors.background, bg = colors.color7 },
        b = { fg = colors.color7, bg = colors.background },
    },
}



local modes = {
    ['n']   =' ',
    ['no']  =' ',
    ['nov'] =' ',
    ['noV'] =' ',
    ['no'] =' ',
    ['niI'] =' ',
    ['niR'] =' ',
    ['niV'] =' ',

    ['i']  =' ',
    ['ic'] =' ',
    ['ix'] =' ',
    ['s']  =' ',
    ['S']  =' ',

    ['v']  =' ',
    ['V']  =' ',
    ['']  =' ',
    ['r']  ='﯒ ',
    ['r?'] =' ',
    ['c']  =' ',
    ['t']  =' ',
    ['!']  =' ',
    ['R']  =' ',
}
local function get_mode()
    local mode_code = vim.api.nvim_get_mode().mode
    if modes[mode_code] == nil then
        return mode_code
    end
    return modes[mode_code]
end

lualine.setup {
    options = {
        icons_enabled = true,
        theme = scheme,
        section_separators ='',
        component_separators ='',
        globalstatus = true,
    },
    sections = {
        lualine_a = { get_mode },
        lualine_b = {'branch', 'diff', 'diagnostics' },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { {'filetype', icon_only = true }, 'filename', 'location'  },
        lualine_z = { }
    },
}
