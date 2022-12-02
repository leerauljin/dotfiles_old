local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup {
  options = {
    -- indicator              = {
    --   style = 'underline',
    -- },
    diagnostics            = "nvim_lsp",
    always_show_bufferline = false,
    color_icons            = false,
  },
  highlights = {
    buffer_selected = {
      italic = false
    },
  }
}
