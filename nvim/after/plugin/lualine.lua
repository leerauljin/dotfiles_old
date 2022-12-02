local status, lualine = pcall(require, "lualine")
if (not status) then return end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    section_separators = '',
    component_separators = '',
  },
}
