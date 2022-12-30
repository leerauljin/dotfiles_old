local wezterm = require 'wezterm'
local color = require 'colors.Everblush'.colors

return {
    default_cursor_stype = 'BlinkingBlock',
    font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" }),
    font_size = 16.0,
    colors = color,
    window_decorations = "RESIZE",
    use_fancy_tab_bar = false,
    tab_bar_at_bottom = true,
    hide_tab_bar_if_only_one_tab = true,
}
