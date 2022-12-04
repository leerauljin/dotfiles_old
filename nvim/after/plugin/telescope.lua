local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

-- configure telescope
telescope.setup {
    defaults = {
        -- prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        results_title = false,
        layout_config = {
            vertical = {
                mirror = true,
            },
            width = 0.6,
            height = 0.8,
            prompt_position = "top",
            preview_cutoff = 1,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = true,
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        color_devicons = false,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
            n = { ["q"] = require("telescope.actions").close },
        },
    },
    extensions = {
        file_browser = {
            -- theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
        },
    },
}

telescope.load_extension("file_browser")
telescope.load_extension("ui-select")

-- local colors = require("horizon.palette").get_palette()
-- local TelescopeColor = {
--     TelescopeMatching = { fg = colors.flamingo },
--     TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },
--
--     TelescopePromptPrefix = { bg = colors.surface0 },
--     TelescopePromptNormal = { bg = colors.surface0 },
--     TelescopeResultsNormal = { bg = colors.mantle },
--     TelescopePreviewNormal = { bg = colors.mantle },
--     TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
--     TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
--     TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
--     TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
--     TelescopeResultsTitle = { fg = colors.mantle },
--     TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
-- }
--
-- for hl, col in pairs(TelescopeColor) do
--     vim.api.nvim_set_hl(0, hl, col)
-- end
