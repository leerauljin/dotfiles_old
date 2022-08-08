local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:


M.ui = {
  theme = "radium",
}

M.plugins = {
  user = require "custom.plugins",
  override = {
    ["NvChad/ui"] = {
      statusline = {
        separator_style = "block"
      }
    },
  }
}

M.mappings = require "custom.mappings"

return M
