local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
    ignore_install = { "markdown" },

    highlight = {
        enable = true,
        disable = { "markdown" },
    },
    indent = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    auto_install = true,
}
