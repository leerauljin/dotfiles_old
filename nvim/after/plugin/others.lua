local s_alpha, alpha = pcall(require, 'alpha')
if (not s_alpha) then return end

alpha.setup(require 'alpha.themes.startify'.config)


local s_leap, leap = pcall(require, 'leap')
if (not s_leap) then return end

leap.add_default_mappings()


local s_comment, comment = pcall(require, "Comment")
if (not s_comment) then return end

comment.setup()


local s_gitsigns, gitsigns = pcall(require, "gitsigns")
if (not s_gitsigns) then return end

gitsigns.setup {}


local s_colorizer, colorizer = pcall(require, 'colorizer')
if (not s_colorizer) then return end

colorizer.setup()
