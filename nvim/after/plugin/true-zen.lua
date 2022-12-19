local ok, zen = pcall(require, 'true-zen')
if not ok then return end

zen.setup {
    integrations = {
        tmux = false,
        kitty = { -- increment font size in Kitty. Note: you must set `allow_remote_control socket-only` and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
            enabled = false,
            font = "+3"
        },
        lualine = true -- hide nvim-lualine (ataraxis)
    },
}
