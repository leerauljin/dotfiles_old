local ok, bufferline = pcall(require, "bufferline")
if not ok then return end


bufferline.setup {
    options = {
        offsets = { { filetype = "NvimTree", text = "" } },
        separator_style = { "", "" },
        indicator = { style = 'none'},
        show_buffer_icons = false,
        show_tab_indicators = false,
        show_close_icon = false,
    },
    highlights = {
        buffer_selected = {
            bold = false,
            italic = false,
        }
    },
}
