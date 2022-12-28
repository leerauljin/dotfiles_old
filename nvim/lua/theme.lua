local ok, everblush = pcall(require, 'everblush')
if not ok then return end

local colors = require('everblush.core').get_colors()
everblush.setup({
    transparent_background = true,
    override = {
        Whitespace     = { fg = colors.color0 },
        GitSignsChange = { fg = colors.color3 },
        CmpItemKind    = { fg = colors.color3 },
        Pmenu          = { bg = colors.color8 },
    }
})
