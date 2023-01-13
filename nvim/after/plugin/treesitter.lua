local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
    ignore_install = {},

    highlight = {
        enable = true,
        disable = { "markdown", 'latex' },
    },
    indent = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    auto_install = true,
}
