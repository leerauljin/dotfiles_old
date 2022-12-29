local ok, everblush = pcall(require, 'everblush')
if not ok then return end
local colors = require('everblush.core').get_colors()
everblush.setup({
    transparent_background = false,
    override = {
        Whitespace         = { fg = colors.color0 },
        GitSignsChange     = { fg = colors.color3 },
        NonText            = { fg = colors.background },
        Pmenu              = { bg = colors.color0 },
        NormalFloat        = { bg = colors.color0 },
        FloatBorder        = { fg = colors.color0, bg = colors.color0 },
        CursorLineNr       = { fg = colors.foreground },
        CursorLine         = { bg = colors.color0 },
        CmpItemAbbr        = { bg = "none" },
        CmpItemMenu        = { bg = "none" },
        CmpItemKind        = { bg = "none" },
        StatusLineNormal   = { fg = colors.foreground },
        StatusLineReplace  = { fg = colors.color1 },
        StatusLineInsert   = { fg = colors.color2 },
        StatusLineCommand  = { fg = colors.color3 },
        StatusLineVisual   = { fg = colors.color4 },
        StatusLineTerminal = { fg = colors.color5 },
        WinSeparator       = { fg = colors.color8, bg = colors.bacground },
        TelescopeSelection = { fg = colors.background, bg = colors.color4 },
        TelescopeMatching  = { fg = colors.color2 },
        NvimTreeGitDirty   = { fg = colors.color3 },
        NvimTreeFolderIcon = { fg = colors.color8 },

        -- dark gray
        CmpItemAbbrDeprecated  = { fg = colors.color8, bg = "none" },
        -- gray
        CmpItemKindVariable    = { fg = colors.color7, bg = "none" },
        -- blue
        CmpItemKindFile        = { fg = colors.color4, bg = "none" },
        CmpItemKindFolter      = { fg = colors.color4, bg = "none" },
        -- light blue
        CmpItemKindInterface   = { fg = colors.color14, bg = "none" },
        -- magenta
        CmpItemKindKeyword     = { fg = colors.color5, bg = "none" },
        CmpItemKindSnippet     = { fg = colors.color5, bg = "none" },
        -- yellow
        CmpItemKindMethod      = { fg = colors.color3, bg = "none" },
        CmpItemKindClass       = { fg = colors.color3, bg = "none" },
        CmpItemKindValue       = { fg = colors.color3, bg = "none" },
        CmpItemAbbrMatchFuzzy  = { fg = colors.color3, bg = "none" },
        -- cyan
        CmpItemKindConstructor = { fg = colors.color6, bg = "none" },
        CmpItemKindFunction    = { fg = colors.color6, bg = "none" },
        -- green
        CmpItemKindText        = { fg = colors.color2, bg = "none" },
        CmpItemAbbrMatch       = { fg = colors.color2, bg = "none" },
        -- red
        CmpItemKindField       = { fg = colors.color1, bg = "none" },
        CmpItemKindProperty    = { fg = colors.color1, bg = "none" },
        -- fg
    }
})
